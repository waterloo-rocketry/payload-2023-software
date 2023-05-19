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
#include <sys/types.h>
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
uint32_t id;
uint8_t length;
uint16_t timestamp;
CAN_MSG_RX_ATTRIBUTE frame_type;


// Kalman Bufferpool

// Unit stanadardization:
// Time is in seconds
int last_hours = 0;
int last_minutes = 0;
int last_seconds = 0;
int last_deciseconds = 0;
double GPS_time = -1; // Keeps track of last MSG_GPS_TIMESTAMP
double GPS_data[3] = {0,0,0}; // Lat Lon Alt
u_int8_t GPS_valid[3] = {0,0,0};
double IMU_time = -1;
double IMU_data[6] = {0,0,0,0,0,0}; // Accel XYZ & Gyro XYZ
u_int8_t IMU_count[6] = {0,0,0,0,0,0};

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

    //We live in clown world
    //Message "receive" fHunction just binds memory to message location???
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type);
    CAN2_Rx_Filter_Manual_Config(); //Fix Rx filter mask config cause the MCC function just does it wrong
    
    //CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);
    while ( true )
    {
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ( );
        //for(int i = 0; i < 100000; ++i);
        
        // TBD: Poll IMU
        IMU_data[0] += data; IMU_count[0]++;
        IMU_data[1] += data; IMU_count[1]++;
        IMU_data[2] += data; IMU_count[2]++;
        IMU_data[3] += data; IMU_count[3]++;
        IMU_data[4] += data; IMU_count[4]++;
        IMU_data[5] += data; IMU_count[5]++;

        // If we have GPS do KalmanIterate
        if (GPS_valid[0] && GPS_valid[1] && GPS_valid[2]){
            // Find averages
            IMU_data[0] /= IMU_count[0];
            IMU_data[1] /= IMU_count[1];
            IMU_data[2] /= IMU_count[2];
            IMU_data[3] /= IMU_count[3];
            IMU_data[4] /= IMU_count[4];
            IMU_data[5] /= IMU_count[5];

            GPS_data[0] /= GPS_valid[0];
            GPS_data[1] /= GPS_valid[1];
            GPS_data[2] /= GPS_valid[2];

            // TBD: Do math to get ap and av

            
            // TBD: Do Kalman with data from arrays
            struct Vector vel = (struct Vector) {get_velocity(), 3};

            struct Matrix Conv = reference_frame_correction(vel, get_orientation(), conv);
                
            struct Vector A_corr = vector_multiplication(Conv, (struct Vector) {a_prev, 3} , a_corr);
            struct Vector X_corr = vector_multiplication(Conv, (struct Vector) {x_prev, 3} , x_corr);

            update_velocity_filter(new_time, x_corr[0], a_corr[0], x_corr[1], a_corr[1], x_corr[2], a_corr[2]);

            const double *state = get_state();
            
            // Clear valid bits
            IMU_count[0] = 0;
            IMU_count[1] = 0;
            IMU_count[2] = 0;
            IMU_count[3] = 0;
            IMU_count[4] = 0;
            IMU_count[5] = 0;

            GPS_valid[0] = 0;
            GPS_valid[1] = 0;
            GPS_valid[2] = 0;
        }
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

void can_msg_handle(uintptr_t context)
{

    // Pretend to receive a CAN message
    can_msg_t message;

    uint16_t id = message.sid;
    u_int8_t datalen = message.datalen; // It's probably safe to just grab all 8 bytes and not use it tbh
    u_int8_t data[8] = message.data;

    //might need to filter messages coming from the same board
    uint16_t msg_id = id & 0x7E0; //grab msg SID from global var which should have been populated by the interrupt handler
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
        case MSG_GPS_TIMESTAMP:
            if (GPS_time == -1){
                // Zeroing
                GPS_time = 0; 
            }
            else{
                // Calculate Time
                double timediff = ((data[3] - last_hours) * 60 * 60 * 60 * 10 + (data[4] - last_minutes) * 60 * 60 * 10 + (data[5] - last_seconds) * 10 + (data[6] - last_deciseconds)) * 0.1;
                GPS_time += timediff;
            }
            last_hours = data[3];
            last_minutes = data[4];
            last_seconds = data[5];
            last_deciseconds = data[6];
            break;
        case MSG_GPS_LAT:
            // TBD: do_parse
            // Dummy Code
            GPS_data[0] = data;
            GPS_valid[0] ++;
            break;
        case MSG_GPS_LON:
            // TBD: do_parse
            // Dummy Code
            GPS_data[1] = data;
            GPS_valid[1] ++;
            break;
        case MSG_GPS_ALT:
            // TBD: do_parse
            // Dummy Code
            GPS_data[2] = data;
            GPS_valid[2] ++;
            break;

    }
    
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type); //this is cursed. Doing this prevents a runtime error. Do not ask me why we have to rebind the same memory addresses to the same locations
    
}

/*******************************************************************************
 End of File
*/

