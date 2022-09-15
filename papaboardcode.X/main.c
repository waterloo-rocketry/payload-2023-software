#include "config.h"
#include "platform.h"
#include "init.h"
#include "canlib/mcp2515/mcp_2515.h"
#include "can_syslog.h"
#include "dspic33epxxxgp50x_can.h"
#include "can_common.h"
#include "message_types.h"
#include "health_checks.h"
#include "can_tx_buffer.h"
#include "sd.h"
#include "error.h"
#include <string.h>
#include <libpic30.h>
#include "timing_util.h"
#include "health_checks.h"
#include "adc1.h"


#include <xc.h>
#define TURN_ON_MAMABOARD (LATBbits.LATB15 = 1)
#define TURN_OFF_MAMABOARD (LATBbits.LATB15 = 0)

#define TURN_ON_37V (LATBbits.LATB0 = 1)
#define TURN_OFF_37V (LATBbits.LATB0 = 0)


#define OSC_CLK 12000000
static uint8_t txb_pool[100];
//bool rocketcan_msg_present = 0;


uint32_t led_heatbeat(uint32_t last_on_time);
uint32_t status_heatbeat(uint32_t last_board_status_msg);
void init_mamacan();
//CAN CALLBACK FUNCTIONS
void can_callback_function(const can_msg_t *message);
//bool check_rocketcan_msg();
uint32_t health_heatbeat(uint32_t last_health_check);


int main(void)
{
    //initialize pin out, oscillator, timers
    init_system();
    ADC1_Initialize();

    //initialize canbus
    init_mamacan();
    //turn on the system
    TURN_ON_MAMABOARD;
    TURN_ON_37V;
    
    //uint32_t last_on_time = 0;
    uint32_t last_board_status_msg = 0;
    uint32_t last_health_check = 0;

    
    //bool to check if mama is on
    while (1) {

        //Check for errors
        
        //health_check looking more broken than the american healthcare system
        last_health_check = health_heatbeat(last_health_check);
        //periodic LED to say we're alive
       // last_on_time = led_heatbeat(last_on_time);
        //periodic im alive message
        last_board_status_msg = status_heatbeat(last_board_status_msg);
        
        txb_heartbeat();

    }
}
uint32_t led_heatbeat(uint32_t last_on_time)
{
    //blink blue LED at 1/3 Hz, duty cycle of 1/12
        if (millis() - last_on_time < 250) {
            LED_1_ON();
            
          
        } else if (millis() - last_on_time < 3000) {
            LED_1_OFF();

        }else
        {
            last_on_time = millis();

        }
        return last_on_time;
}

uint32_t status_heatbeat(uint32_t last_board_status_msg)
{
    //give status update
        if (millis() - last_board_status_msg > 1000) {
            LED_2_ON();
            can_msg_t board_stat_msg;
            // for now just always pretend everything is ok
            if (any_errors()) 
            {
                uint8_t e = (uint8_t) get_last_error();
                build_board_stat_msg(millis(), E_LOGGING, &e, 1, &board_stat_msg);
                clear_errors();
            } else {
                build_board_stat_msg(millis(), E_NOMINAL, NULL, 0, &board_stat_msg);
            }
            
            txb_enqueue(&board_stat_msg);
            
            LED_2_OFF();
           last_board_status_msg = millis();

        }
        
        return last_board_status_msg;

}

void init_mamacan()
{
      //Initialization of can module using internal can controller
    //timing parameters that cause a bit time of 24us
    /* FCAN is 32MHz,
     * bit time is 5+5+1+1 = 12 time quanta
     * bit time is 12 * (BRP + 1) * 2 / 32= 24
     * so BRP + 1 = 32
     */
   can_timing_t timing;
   can_generate_timing_params(FCY, &timing);
   init_can(&timing, can_callback_function, false);
   txb_init(txb_pool, sizeof(txb_pool), can_send, can_send_rdy);
}

void can_callback_function(const can_msg_t *message)
{
    //handle a "LED_ON" or "LED_OFF" message
    //incoming mamaboard and minisensor data can pass right through to be logged
    switch (get_message_type(message)) {
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
        case MSG_ACTUATOR_CMD:
            if (message->data[3] == MAMA_BOARD_ACTIVATE) {
                TURN_ON_MAMABOARD;
                TURN_ON_37V;
                LED_3_ON();
            }
            else{
              error(E_CAN_MSG_ACT_UNKNOWN);
              LED_2_ON();
              LED_1_ON();
            }
            break;
        case 0:
            error(E_CAN_MSG_UNKNOWN);
            LED_3_ON();
            LED_2_ON();
            break;
        default:
            error(E_CAN_MSG_UNHANDLED);
            LED_1_ON();
            LED_2_ON();
            break;
    }
    //sends can message to SYSLOG (for logging)
}


uint32_t health_heatbeat(uint32_t last_health_check)
{
    //give status update

    if(millis() -last_health_check > 1000 )
    {
            bool status_ok = true;

           //status_ok = check_battery_over_current() & status_ok;
           status_ok = check_battery_extreme_voltage() & status_ok;
           // status_ok = check_3v3_over_current() & status_ok;
            
            if (!status_ok) {
                TURN_OFF_MAMABOARD;
                TURN_OFF_37V;
            }
            
           
        last_health_check = millis();
    }
    return last_health_check;
}
