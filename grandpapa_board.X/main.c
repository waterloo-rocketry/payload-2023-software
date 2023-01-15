/*
 * File:   newmain.c
 * Author: joedo
 *
 * Created on January 8, 2023, 4:23 PM
 */

//Generic C Stuff
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// MPLAB Stuff
#include <xc.h>

//Canlib Stuff
#include "canlib/can.h"
#include "canlib/can_common.h"
#include "canlib/message_types.h"

#include "canlib/pic18f26k83/pic18f26k83_can.h"
#include "canlib/pic18f26k83/pic18f26k83_timer.h"

#include "canlib/util/timing_util.h"
#include "canlib/util/can_tx_buffer.h"

static void send_status_ok(void);

void main(void) {
    
    
    /* BIG TODO LIST:
     * 
     * PIC18 Pin and CAN Initialization
     * Debug LEDs Setup
     * 
     * RocketCAN message handler for:
     * - Reporting Status (current draws, battery state, errors, etc)
     * - Enabling/Disabling 12V power draw
     * - External Enable/Disable 5V line command (restart payload bus)
     * - Begin State Estimation (injector valve open message???)
     * 
     * Payload CAN message handling
     *  - Begin State Estimation
     * 
     * SPI Send/Receive to MCP2515
     * MCP2515 Initialization
     * 
     * 
     * 
     * 
     */
    
    uint8_t max_time;
    
    
    //Initialize Stuff w/ Functions
    can_init();
    
    while(1){
        
    }
    
    
    return;
}

// Send a CAN message with nominal status
static void send_status_ok(void) {
    can_msg_t board_stat_msg;
    build_board_stat_msg(millis(), E_NOMINAL, NULL, 0, &board_stat_msg);

    // send it off at low priority
    txb_enqueue(&board_stat_msg);
}
