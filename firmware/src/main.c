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
#include "gps_conversion.h"


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
void can_msg_handle(uintptr_t context);

uint8_t buffer[]= "Hello World!\r\n";
uint8_t status[] = {0x00, 0xFF, 0xFF, 0x00};
uint8_t can_rx_buffer[8];
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
double GPS_data_initial[3] = {-1, -1, -1};
double GPS_data[3] = {-1,-1,-1}; // Lat Lon Alt
u_int8_t GPS_valid[3] = {0,0,0};
double IMU_data[3] = {-1,-1,-1}; // Accel XYZ 
u_int8_t IMU_count[3] = {0,0,0};

#define fifoNum 0
#define msgAttr 0

void sendMsg(double msg, double time){

    const u_int8_t len = 7;

    u_int8_t data[len];
    
    // message format: sssss.sss
    // 3 digits behind dec point
    u_int16_t wholetime = time;
    double decs = (time - wholetime) * 100;
    // note that deci time is at most 3 decimals after 0
    u_int8_t decitime = decs;

    data[0] = (wholetime >> 8) & 0xff;
    data[1] = (wholetime >> 0) & 0xff;
    data[2] = decitime;

    // message format: mmmmm.mmmm
    // 4 digits behind dec point
    u_int16_t wholemsg = msg;
    double decm = (msg - wholemsg) * 1000;
    u_int16_t decimsg = decm;

    data[3] = (wholemsg >> 8) & 0xff;
    data[4] = (wholemsg >> 0) & 0xff;
    data[5] = (decimsg >> 8) & 0xff;
    data[6] = (decimsg >> 0) & 0xff;

    CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, len, data, fifoNum, msgAttr);

}

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    UART6_Write(&buffer[0], sizeof(buffer));
    CAN2_CallbackRegister(can_msg_handle, (uintptr_t)NULL, 1);
    CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);
    
    /*
    double new_time, ap, av;
    for (int i = 0; i < 4; ++i) {
        new_time = data[i][0];

        // ap = data[i][1];
        av = data[i][2];
        
        update_rotation_filter(new_time, av);
        sprintf((char *) buffer, "%f\n", get_orientation());
        
        UART6_Write(buffer, sizeof(buffer));
    }
    */

    //We live in clown world
    //Message "receive" fHunction just binds memory to message location???
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type);
    CAN2_Rx_Filter_Manual_Config(); //Fix Rx filter mask config cause the MCC function just does it wrong
    
    //CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);
    while ( true )
    {
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ( );

        // If we have GPS do KalmanIterate
        if (GPS_valid[0] && GPS_valid[1] && GPS_valid[2]){
            // Find averages
            IMU_data[0] /= IMU_count[0];
            IMU_data[1] /= IMU_count[1];
            IMU_data[2] /= IMU_count[2];

            GPS_data[0] /= GPS_valid[0];
            GPS_data[1] /= GPS_valid[1];
            GPS_data[2] /= GPS_valid[2];

            struct Vector vel = (struct Vector) {get_velocity(), 3};

            struct Matrix Conv = reference_frame_correction(vel, get_orientation(), conv);
            
            struct Vector A_corr = vector_multiplication(Conv, (struct Vector) {IMU_data, 3}, a_corr);
            //struct Vector X_corr = vector_multiplication(Conv, (struct Vector) {x_prev, 3} , x_corr);

            // GPS Conv (coords to meters)

            // timestamp, GPS_value[0], acc[0] ......
            update_velocity_filter(GPS_time, x_prev, a_corr[0], x_corr[1], a_corr[1], GPS_data[2], a_corr[2]);

            const double *state = get_state();

            // send data
            sendMsg(state[0], GPS_time);
            sendMsg(state[1], GPS_time);
            sendMsg(state[2], GPS_time);
            sendMsg(state[3], GPS_time);
            sendMsg(state[4], GPS_time);
            sendMsg(state[5], GPS_time);
            sendMsg(state[6], GPS_time);
            sendMsg(state[7], GPS_time);
            sendMsg(state[8], GPS_time);
            
            
            // Clear valid bits and zero the data if needed
            IMU_count[0] = 0;
            IMU_count[1] = 0;
            IMU_count[2] = 0;

            GPS_valid[0] = 0;
            GPS_valid[1] = 0;
            GPS_valid[2] = 0;
            GPS_data[0] = 0;
            GPS_data[1] = 0;
            GPS_data[2] = 0;
        }
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

void can_msg_handle(uintptr_t context)
{

    // Pretend to receive a CAN message
    can_msg_t message;


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
                // To be actuated
                // Zeroing
                GPS_time = 0; 
            }
            else{
                // Calculate Time
                double timediff = ((can_rx_buffer[3] - last_hours) * 60 * 60 * 60 * 10 + (can_rx_buffer[4] - last_minutes) * 60 * 60 * 10 + (can_rx_buffer[5] - last_seconds) * 10 + (can_rx_buffer[6] - last_deciseconds)) * 0.1;
                GPS_time += timediff;
            }
            last_hours = can_rx_buffer[3];
            last_minutes = can_rx_buffer[4];
            last_seconds = can_rx_buffer[5];
            last_deciseconds = can_rx_buffer[6];
            break;
        case MSG_GPS_LAT:
            // deciminute is 4 digits after minute
            // current data reading
            double lat = can_rx_buffer[3] * 60 + can_rx_buffer[4];
            u_int16_t dmin = (((u_int16_t)can_rx_buffer[5]) << 8) | (u_int16_t)can_rx_buffer[6];
            lat += dmin*0.001;

            GPS_data[0] = lat;

            // Record initial
            if (GPS_data_initial[0] == -1){
                GPS_data_initial[0] = GPS_data[0];
            }
            GPS_valid[0] = 1;
            break;
        case MSG_GPS_LON:
            // deciminute is 4 digits after minute
            // current data reading
            double lon = can_rx_buffer[3] * 60 + can_rx_buffer[4];
            u_int16_t dmin = (((u_int16_t)can_rx_buffer[5]) << 8) | (u_int16_t)can_rx_buffer[6];
            lon += dmin*0.001;

            GPS_data[1] = lon;

            // Record initial
            if (GPS_data_initial[1] == -1){
                GPS_data_initial[1] = GPS_data[0];
            }
            GPS_valid[1] = 1;
            break;
        case MSG_GPS_ALT:
            u_int16_t alt = (((uint16_t)can_rx_buffer[3] << 8 | (uint16_t)can_rx_buffer[4]));
            double altitude = alt + 0.01*(can_rx_buffer[6]);
            if (GPS_data_initial[2] == -1){
                GPS_data_initial[2] = altitude;
            }
            GPS_data[2] = altitude - GPS_data_initial[2];
            GPS_valid[2] = 1;
            break;

        // ICM-20948
        // g
        case SENSOR_ACC:
            // To m/s^2
            u_int16_t xa = (((uint16_t)can_rx_buffer[2] << 8 | (uint16_t)can_rx_buffer[3]));
            u_int16_t ya = (((uint16_t)can_rx_buffer[4] << 8 | (uint16_t)can_rx_buffer[5]));
            u_int16_t za = (((uint16_t)can_rx_buffer[6] << 8 | (uint16_t)can_rx_buffer[7]));
            double x_acc = xa*9.81/2048; // +-16g
            double y_acc = ya*9.81/2048; 
            double z_acc = za*9.81/2048; 
            IMU_data[0] += x_acc;
            IMU_data[1] += y_acc;
            IMU_data[2] += z_acc;
            IMU_count[0] ++;
            IMU_count[1] ++;
            IMU_count[2] ++;
            break;
        
        // dps
        case SENSOR_GYRO:
            // Timestamp

            u_int16_t zg = ((uint16_t)can_rx_buffer[6] << 8 | (uint16_t)can_rx_buffer[7]);
            double z_ang = to_radians((double)zg/16.4); // +-2000 dps to radians             
            // dps to rps

            double timestamp = ((u_int16_t)can_rx_buffer[0] << 8 | (uint16_t)can_rx_buffer[1])*0.001;

            update_rotation_filter(timestamp, z_ang);

            break;
    }
    
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type); //this is cursed. Doing this prevents a runtime error. Do not ask me why we have to rebind the same memory addresses to the same locations
    
}

/*******************************************************************************
 End of File
*/

