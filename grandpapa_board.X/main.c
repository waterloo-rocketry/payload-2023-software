//Generic C Stuff
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

//Canlib Stuff
#include "canlib/can.h"
#include "canlib/can_common.h"
#include "canlib/pic18f26k83/pic18f26k83_can.h"
#include "canlib/message_types.h"
#include "canlib/util/timing_util.h"
#include "canlib/util/can_tx_buffer.h"
#include "canlib/pic18f26k83/pic18f26k83_timer.h"
#include "canlib/mcp2515/mcp_2515.h"
#include "spi_shit.h"

// MPLAB Stuff
#include <xc.h> //should be after any pragma statements
#include "interrupt_manager.h"
#define _XTAL_FREQ  12000000 //Base clock freq is 12 MHz

#define MAX_LOOP_TIME_DIFF_ms 1000
#define LED_1_OFF() (LATC5 = 0)
#define LED_2_OFF() (LATC6 = 0)
#define LED_3_OFF() (LATC7 = 0)
#define LED_1_ON() (LATC5 = 1)
#define LED_2_ON() (LATC6 = 1)
#define LED_3_ON() (LATC7 = 1)
#define BOARD_ID = 0x13

static void can_msg_handler(const can_msg_t *msg); //called during ISR when the PIC CAN module triggers
static void mcp_msg_handler(can_msg_t *msg); //manually called when 
static void send_status_ok(void); //send a "nominal" message, whatever that means for us
static void send_status_ok_mcp(void);

static uint8_t read_spi_byte(void);
static void write_spi_byte(uint8_t data);
static void drive_mcp_cs(uint8_t state);

// Statically allocate memory pool for CAN transmit buffer
uint8_t tx_pool[100];

void OSCILLATOR_Initialize() // this is copied from MCC but the registers have been verified
{
    OSCCON1bits.NDIV = 0x0; //Set oscillator divider to 1:1
    OSCCON1bits.NOSC = 0x2; //select external oscillator w 4x PLL

    //wait until the clock switch has happened
    while (OSCCON3bits.ORDY == 0)  {}

    //if the currently active clock (CON2) isn't the selected clock (CON1)
    if (OSCCON2 != 0x20) {
    //Unhandled error (the oscillator isn't there). Fail fast, with an infinite loop.
        while (1) {}
    }
}

void main(void) {
    //Initialize Oscillator (External 12MHz crystal; See config registers for add'l settings)
    OSCILLATOR_Initialize();
    
    //Enable global interrupts
    INTERRUPT_GlobalInterruptEnable();
    spi_init();
    
    //Enable 12V buck
    TRISA1 = 0;
    LATA1 = 1;
    
    //Config for internal CAN controller
    //Set pin RB3 as CAN Rx
     TRISB3 = 1;
     ANSELB3 = 0;
     CANRXPPS = 0b001011;
    
    //Set pin RB4 as CAN Tx 0
     TRISB4 = 0;
     RB4PPS = 0b110011;
    
    //Canlib initializations for PIC18 CAN module and MCP2515
     can_timing_t can_params;
     can_generate_timing_params(_XTAL_FREQ, &can_params); //Store all the custom timing parameters in a fancy struct
    
     can_init(&can_params, can_msg_handler); //Point canlib to our timing parameters and custom message handler
    
     txb_init(tx_pool, sizeof(tx_pool), can_send, can_send_rdy); //Point canlib to the chunk of memory we just allocated for a transmit buffer
                                                                 //can_send and can_send_ready are MCU-specific functions
    
    //MCP2515
     //Set RC0 as clock output reference at 12 MHz
     CLKRCLKbits.CLK = 0b0000;
     CLKRCONbits.DIV = 0b011;
     CLKRCONbits.DC = 0b10;
     CLKRCONbits.EN = 1;
     TRISC0 = 0;
     RC0PPS = 0b100111;
     
     for(int i=0;i<1000;i++);
     
     mcp_can_init(&can_params, read_spi_byte, write_spi_byte, drive_mcp_cs);
     
    
    //Timing stuff
    timer0_init();
    uint32_t last_millis = millis();
    
    //Set LED pins as output pins
    TRISC5 = 0;
    TRISC6 = 0;
    TRISC7 = 0;
    
    LED_1_OFF();
    LED_2_OFF();
    LED_3_OFF();
    
    // main event loop
    while (1) {
        if(millis()- last_millis > MAX_LOOP_TIME_DIFF_ms){
            LATC5 = ~LATC5;
            //LATC6 = ~LATC6;
            //LATC7 = ~LATC7;
            send_status_ok_mcp();
            //write_spi_byte(0x0F);

            last_millis = millis();
        }
       
        //txb_heartbeat();
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
    //this function is passed to canlib when we initialize it
    //When we call the generic canlib function "can_handle_interrupt", it calls this function which defines our board-specific behaviours
    uint16_t msg_type = get_message_type(msg);
    switch(msg_type){
        case MSG_LEDS_ON:
            LED_1_ON();
            LED_2_ON();
            LED_3_ON();
            break;
        case MSG_LEDS_OFF:
            LED_1_OFF();
            LED_2_OFF();
            LED_3_OFF();
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

static void send_status_ok_mcp(void) {
    can_msg_t board_stat_msg;
    build_board_stat_msg(millis(), E_NOMINAL, NULL, 0, &board_stat_msg);

    // send it off
    while(!mcp_can_send_rdy());
    mcp_can_send(&board_stat_msg);
}

static void drive_mcp_cs(uint8_t state){
    if(state) LATC1 = 1;
    else LATC1 = 0;
}

static uint8_t read_spi_byte(void){
    uint8_t temp = SPI1RXB;
    SPI1TXB = 0x0; //write dummy byte to transmit
    while(!SPI1TXBE);
    return SPI1RXB;
}

static void write_spi_byte(uint8_t data){
    SPI1TXB = data;
    while(!SPI1TXBE);
    uint8_t temp = SPI1RXB; //read from the RXFIFO to hopefully purge it
}

