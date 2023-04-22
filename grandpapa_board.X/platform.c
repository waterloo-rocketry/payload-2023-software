#include <xc.h>
#include "platform.h"

// LEDs and switches
#define LED_ON 1 // it was LED_ON 0 in cansw_template, double check please
#define CAN_5V_ON 1
#define POWER_12V_ON 1

void papa_init(void) {
    // LEDS
    TRISC5 = 0; // set white LED pin as output
    ANSELC5 = 0; // enable digital input buffer (Useful for reading the LED state)
    LATC5 = !LED_ON;

    TRISC6 = 0; // set red LED pin as output
    ANSELC6 = 0; // enable digital input buffer (Useful for reading the LED state)
    LATC6 = !LED_ON;

    TRISC7 = 0; // set blue LED pin as output
    ANSELC7 = 0; // enable digital input buffer (Useful for reading the LED state)
    LATC7 = !LED_ON;

    // 5V PayloadCAN
    TRISA0 = 0; // allow 5V line to be toggleable
    LATA0 = CAN_5V_ON;

    // 12V power line
    TRISA1 = 0; // allow 12V buck to be toggleable
    LATA1 = POWER_12V_ON;
}

void WHITE_LED_SET(bool value) {
    LATC5 = !value ^ LED_ON;
}

void RED_LED_SET(bool value) {
    LATC6 = !value ^ LED_ON;
}

void BLUE_LED_SET(bool value) {
    LATC7 = !value ^ LED_ON;
}

void CAN_5V_SET(bool value) {
    LATA0 = !value ^ CAN_5V_ON;
}

void POWER_12V_SET(bool value) {
    LATA1 = !value ^ POWER_12V_ON;
}
