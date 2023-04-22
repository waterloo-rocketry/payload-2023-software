/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "../kalman_board.X/canlib/message_types.h"


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
void can_msg_handle(uintptr_t context);

uint8_t buffer[]= "Hello World!\r\n";
uint8_t status[] = {0x00, 0xFF, 0xFF, 0x00};
uint8_t can_rx_buffer[8];
uint32_t id;
uint8_t length;
uint16_t timestamp;
CAN_MSG_RX_ATTRIBUTE frame_type;

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    UART6_Write(&buffer[0], sizeof(buffer));
    //
    CAN2_CallbackRegister(can_msg_handle, (uintptr_t)NULL, 1);

    //CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);

    //We live in clown world
    //Message "receive" function just binds memory to message location???

    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type);
    
    //Do my own damn Rx filter configuration
    C2FLTCON0bits.FLTEN0 = 0; //disable the filter to swap mask
    C2RXF0bits.SID = 0x7C0; //we are going to try and ignore this with masking
    C2RXF0bits.EXID = 0; //dont match extended ID messages
    C2FLTCON0bits.MSEL0 = 1; //select Mask 0 as the mask for this filter
    C2FLTCON0bits.FSEL0 = 1; //store messages in FIFO 1
    
    C2RXM0bits.SID = 0x0; //mask all filter bits - match any message
    C2RXM0bits.MIDE = 1;
            
    C2FLTCON0bits.FLTEN0 = 1; //enable the filter again
    
    
    //turn on LEDs
    LATJbits.LATJ3 = 0;
    LATJbits.LATJ7 = 0;
    LATKbits.LATK7 = 0;
    
    while ( true )
    {
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ( );
        
        //if(CAN2_InterruptGet(1, CAN_FIFO_INTERRUPT_RXNEMPTYIF_MASK))
        //{
           //can_msg_handle((uintptr_t)NULL);
            //CAN2_InterruptHandler();
            //C2FIFOINT1CLR &= !0x1;
            
        //}
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

void can_msg_handle(uintptr_t context)
{
    

    uint16_t msg_id = id & 0x7E0;
    switch (msg_id) {
        case MSG_LEDS_ON:
            LATJbits.LATJ3 = 0;
            LATJbits.LATJ7 = 0;
            LATKbits.LATK7 = 0;
            break;
        case MSG_LEDS_OFF:
            LATJbits.LATJ3 = 1;
            LATJbits.LATJ7 = 1;
            LATKbits.LATK7 = 1;
            break;
    }
    
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type);
    
}

/*******************************************************************************
 End of File
*/

