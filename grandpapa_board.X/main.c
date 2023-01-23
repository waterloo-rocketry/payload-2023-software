//Generic C Stuff
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "canlib/pic18f26k83/pic18f26k83_timer.h"
#include "interrupt_manager.h"

// MPLAB Stuff
#include <xc.h> //should be after any pragma statements


#define MAX_LOOP_TIME_DIFF_ms 250
#define LED_1_OFF() (LATC5 = 0)
#define LED_2_OFF() (LATC6 = 0)
#define LED_3_OFF() (LATC7 = 0)
#define LED_1_ON() (LATC5 = 1)
#define LED_2_ON() (LATC6 = 1)
#define LED_3_ON() (LATC7 = 1)

void OSCILLATOR_Initialize() // this is copied from MCC but the registers have been verified
{
    OSCCON1bits.NDIV = 0x0; //Set oscillator divider to 1:1
    OSCCON1bits.NOSC = 0x7; //select external oscillator

    //wait until the clock switch has happened
    while (OSCCON3bits.ORDY == 0)  {}

    //if the currently active clock (CON2) isn't the selected clock (CON1)
    if (OSCCON2 != 0x70) {
        //Unhandled error (the oscillator isn't there). Fail fast, with an infinite loop.
        while (1) {}
    }
}

void main(void) {
    //Initialize Oscillator
    OSCILLATOR_Initialize();
    
    //Enable global interrupts
    //INTCON0bits.GIE = 1;
    INTERRUPT_GlobalInterruptEnable();
    
    //Initialize Registers to support our pinout
    TRISC5 = 0;
    TRISC6 = 0;
    TRISC7 = 0;
    
    //Timing stuff
    timer0_init();
    uint32_t last_millis = millis();
    uint32_t max_time_diff = 1000;

    
    // main event loop
    while (1) {
        //LATC7 = ~LATC7;
        //LATC7 = 1;
        //LATC6 = ~LATC6;
        //LATC5 = ~LATC5;
        if(millis()- last_millis > max_time_diff){
            LATC5 = ~LATC5;
            LATC6 = ~LATC6;
            LATC7 = ~LATC7;
            last_millis = millis();
        }
    }
    
    return;
}

//static void interrupt interrupt_handler() {
static void __interrupt() interrupt_handler(void) {
    // Timer0 has overflowed - update millis() function
    // This happens approximately every 500us
    if (PIE3bits.TMR0IE == 1 && PIR3bits.TMR0IF == 1) {
        timer0_handle_interrupt();
        PIR3bits.TMR0IF = 0;
    }
}
