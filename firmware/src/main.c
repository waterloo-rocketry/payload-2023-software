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
//#include "../kalman_board.X/kalman_lib/kalman_lib.h"
#include "../kalman_board.X/kalman_lib/data.h"


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
void can_msg_handle(uintptr_t context);

uint8_t buffer[]= "Hello World!\r\n";
uint8_t status[] = {0x00, 0xFF, 0xFF, 0x00};
uint8_t can_rx_buffer[8];

double data[4][3] = {
    {0.01, -0.6603976331469725, 2.8701727385873443},
    {0.02, 0.5514217753381881, 1.786205976679928},
    {0.03, -1.1823052592829146, 2.404824683140402},
    {0.04, -0.9388002514842552, 2.551810961740738}
};

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    UART6_Write(&buffer[0], sizeof(buffer));
    //
    CAN2_CallbackRegister(can_msg_handle, (uintptr_t)NULL, 1);
    CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);
    
    double new_time, ap, av;
    for (int i = 0; i < 4; ++i) {
        new_time = data[i][0];
        ap = data[i][1];
        av = data[i][2];
        
        update_rotation_filter(new_time, ap, av);
        sprintf((char *) buffer, "%f\n", get_orientation());
        
        UART6_Write(buffer, sizeof(buffer));
    }

    while ( true )
    {
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ( );
        //for(int i = 0; i < 100000; ++i);
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

void can_msg_handle(uintptr_t context)
{
    uint32_t id;
    uint8_t length;
    uint16_t timestamp;
    CAN_MSG_RX_ATTRIBUTE frame_type;
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 0, &frame_type);

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
    
}

/*******************************************************************************
 End of File
*/

