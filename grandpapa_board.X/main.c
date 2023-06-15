// Generic C Stuff
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Canlib Stuff
#include "canlib/can.h"
#include "canlib/can_common.h"
#include "canlib/pic18f26k83/pic18f26k83_can.h"
#include "canlib/message_types.h"
#include "canlib/util/timing_util.h"
#include "canlib/util/can_tx_buffer.h"
#include "canlib/pic18f26k83/pic18f26k83_timer.h"
#include "canlib/mcp2515/mcp_2515.h"

// Our stuff
#include "spi_shit.h"
#include "platform.h"

// MPLAB Stuff
#include <xc.h> //should be after any pragma statements
#include "interrupt_manager.h"
#define _XTAL_FREQ 12000000 // Base clock freq is 12 MHz
#define _MCP_FREQ 6000000   // Base clock freq is 12 MHz

static void can_msg_handler(const can_msg_t *msg); // called during ISR when the PIC CAN module triggers
static void mcp_can_msg_handler(const can_msg_t *msg);
static void send_status_ok(void); // send a "nominal" message, whatever that means for us
static void send_mcp_msg(const can_msg_t *msg);
static void send_status_life_off_mcp(void);

static uint8_t read_spi_byte(void);
static void write_spi_byte(uint8_t data);
static void drive_mcp_cs(uint8_t state);
static uint8_t stateEstimationCount;
// Statically allocate memory pool for CAN transmit buffer
uint8_t tx_pool[100];

// this is copied from MCC but the registers have been verified
void OSCILLATOR_Initialize() {
    OSCCON1bits.NDIV = 0x0;   // Set oscillator divider to 1:1
    OSCCON1bits.NOSC = 0b111; // select external oscillator w/o  (12MHz))

    // wait until the clock switch has happened
    while (OSCCON3bits.ORDY == 0) {}

    // if the currently active clock (CON2) isn't the selected clock (CON1)
    // if (OSCCON2 != 0x20) {
    // Unhandled error (the oscillator isn't there). Fail fast, with an infinite loop.
    //     while (1) {}
    //}
}

void main(void) {
    // Initialize Oscillator (External 12MHz crystal; See config registers for add'l settings)
    OSCILLATOR_Initialize();

    // Enable global interrupts
    INTERRUPT_GlobalInterruptEnable();
    spi_init();
    papa_init();

    // Config for internal CAN controller
    // Set pin RB3 as CAN Rx
    TRISB3 = 1;
    ANSELB3 = 0;
    CANRXPPS = 0b001011;

    // Set pin RB4 as CAN Tx 0
    TRISB4 = 0;
    RB4PPS = 0b110011;

    // Canlib initializations for PIC18 CAN module and MCP2515
    can_timing_t can_params;
    can_timing_t can_params_mcp;
    can_generate_timing_params(_XTAL_FREQ, &can_params); // Store all the custom timing parameters in a fancy struct
    can_generate_timing_params(_MCP_FREQ, &can_params_mcp);

    can_init(&can_params, can_msg_handler);                     // Point canlib to our timing parameters and custom message handler
    txb_init(tx_pool, sizeof(tx_pool), can_send, can_send_rdy); // Point canlib to the chunk of memory we just allocated for a transmit buffer
                                                                // can_send and can_send_ready are MCU-specific functions

    // MCP2515
    // Set RC0 as clock output reference at 12 MHz
    CLKRCLKbits.CLK = 0b0000; // select Fosc (12MHz))
    CLKRCONbits.DIV = 0b001;  // 1:2 clock divider 6MHz
    CLKRCONbits.DC = 0b10;    // 50% duty cycle
    CLKRCONbits.EN = 1;
    TRISC0 = 0;
    RC0PPS = 0b100111; // Assign clock ref module to pin RC0

    mcp_can_init(&can_params_mcp, read_spi_byte, write_spi_byte, drive_mcp_cs);

    // MCP CAN Receive Interrupt
    // IOCAN5 = 1; //Enable interrupt on falling edge at RA5
    // IOCIE = 1; //Global enable for IOC module
    TRISA5 = 1;  // Set RA5 to input
    ANSELA5 = 0; // Disable ANSEL reeeee

    // Timing stuff
    timer0_init();
    uint32_t last_millis = millis();

    // main event loop
    bool heartbeat = true;
    while (1) {
        if (millis() - last_millis > MAX_LOOP_TIME_DIFF_ms) {
            // update our loop counter
            last_millis = millis();

            // visual heartbeat indicator
            WHITE_LED_SET(heartbeat);
            heartbeat = !heartbeat;

            // can_msg_t board_stat_msg;
            // build_board_stat_msg(millis(), E_NOMINAL, NULL, 0, &board_stat_msg);
            // send_mcp_msg(&board_stat_msg);
        }

        // need to manually check for payloadCAN messages (theres no interrupt)
        if (!PORTAbits.RA5) {
            can_msg_t rcv;
            if (mcp_can_receive(&rcv)) {
                mcp_can_msg_handler(&rcv);
            }
        }
        // send any queued CAN messages
        txb_heartbeat();
    }
    return;
}

static void __interrupt() interrupt_handler(void) {
    if (PIR5) {
        can_handle_interrupt();
    }

    // Timer0 has overflowed - update millis() function
    // This happens approximately every 500us
    if (PIE3bits.TMR0IE == 1 && PIR3bits.TMR0IF == 1) {
        timer0_handle_interrupt();
        PIR3bits.TMR0IF = 0;
    }
}

static void can_msg_handler(const can_msg_t *msg) {
    // this function is passed to canlib when we initialize it
    // When we call the generic canlib function "can_handle_interrupt", it calls this function which defines our board-specific behaviours
    uint16_t msg_type = get_message_type(msg);

    // ignore messages that were sent from this board
    if (get_board_unique_id(msg) == BOARD_ID) {
        return;
    }

    // declare this in advance cause we can't declare it inside the switch
    int act_id = -1;
    int act_state = -1;

    switch (msg_type) {
        case MSG_ACTUATOR_CMD:
            act_id = get_actuator_id(msg);
            act_state = get_req_actuator_state(msg);

            if (act_id == ACTUATOR_PAYLOAD) {
                if (act_state != ACTUATOR_ON && act_state != ACTUATOR_OFF) {
                    return;
                }
                // (dis)connect from 12V
                POWER_12V_SET(act_state == ACTUATOR_ON);
            }
            else if (act_id == ACTUATOR_PAYLOAD_5V) { // TODO: this needs to be added onto canlib
                if (act_state != ACTUATOR_ON && act_state != ACTUATOR_OFF) {
                    return;
                }
                // turn on/off PayloadCAN
                CAN_5V_SET(act_state == ACTUATOR_ON);
            }
            else if (act_id == ACTUATOR_INJECTOR_VALVE) {
                // rocket is flying, relay this message to PayloadCAN for Kalman board
                send_mcp_msg(msg);
            }
            break;
            
        case MSG_GPS_TIMESTAMP:
            send_mcp_msg(msg);
            break;
        case MSG_GPS_LATITUDE:
            send_mcp_msg(msg);
            break;
        case MSG_GPS_LONGITUDE:
            send_mcp_msg(msg);
            break;
        case MSG_GPS_ALTITUDE:
            send_mcp_msg(msg);
            break;

          
    case MSG_LEDS_ON:
        WHITE_LED_SET(true);
        RED_LED_SET(true);
        BLUE_LED_SET(true);
        break;

    case MSG_LEDS_OFF:
        WHITE_LED_SET(false);
        RED_LED_SET(false);
        BLUE_LED_SET(false);
        break;
    }
}

// Send a CAN message with nominal status
static void send_status_ok(void) {
    can_msg_t board_stat_msg;
    build_board_stat_msg(millis(), E_NOMINAL, NULL, 0, &board_stat_msg);

    // send it off
    txb_enqueue(&board_stat_msg);
}

static void send_mcp_msg(const can_msg_t *msg) {
    // send it off
    while (!mcp_can_send_rdy()) {}
    mcp_can_send(msg);
}

static void drive_mcp_cs(uint8_t state) {
    if (state)
        LATC1 = 1;
    else
        LATC1 = 0;
}

static uint8_t read_spi_byte(void) {
    uint8_t temp = SPI1RXB;
    SPI1TXB = 0x0; // write dummy byte to transmit
    while (!SPI1TXBE) {}
    return SPI1RXB;
}

static void write_spi_byte(uint8_t data) {
    SPI1TXB = data;
    while (!SPI1TXBE) {}
    uint8_t temp = SPI1RXB; // read from the RXFIFO to hopefully purge it
}

static void mcp_can_msg_handler(const can_msg_t *msg) {
    uint16_t msg_type = get_message_type(msg);

    // ignore messages that were sent from this board
    if (get_board_unique_id(msg) == BOARD_ID) {
        return;
    }
    else if (get_board_unique_id(msg) == BOARD_ID_ACTUATOR_CAM1){
        return;
    }

    switch (msg_type) {
        // forward all board status messages to RocketCAN
        case MSG_GENERAL_BOARD_STATUS:
            txb_enqueue(msg);
            break;

        /*
        case <kalman board message>:
            stateEstimationCount++;
            if (stateEstimationCount == STATE_ESTIMATION_FREQUENCY) {
                stateEstimationCount = 0;
                txb_enqueue(msg);
            }
            break;
        */

        case MSG_LEDS_ON:
            WHITE_LED_SET(true);
            RED_LED_SET(true);
            BLUE_LED_SET(true);
            break;

        case MSG_LEDS_OFF:
            WHITE_LED_SET(false);
            RED_LED_SET(false);
            BLUE_LED_SET(false);
            break;
    }
}
