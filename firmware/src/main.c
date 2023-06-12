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

#include <math.h>
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <sys/types.h>
#include "definitions.h"                // SYS function prototypes
#include "../kalman_board.X/canlib/message_types.h"
//#include "../kalman_board.X/kalman_lib/kalman_lib.h"
#include "../kalman_board.X/kalman_lib/data.h"
#include "../kalman_board.X/kalman_lib/gps_conversion.h"
#include "../kalman_board.X/kalman_lib/orientation_conversion.h"


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
void can_msg_handle(uintptr_t context);
void timer_2_callback (uint32_t status, uintptr_t context);
void sendMsg(double time, double message, u_int8_t datatype);
uint32_t millis(void);

uint32_t last_millis = 0;
#define MILLIS_STUFF 1000 // Timer report interval

uint8_t buffer[]= "Hello World!\r\n";
uint8_t status[] = {0x00, 0xFF, 0xFF, 0x00};
uint8_t can_rx_buffer[8];
uint8_t length;
uint16_t timestamp;
uint32_t id;
CAN_MSG_RX_ATTRIBUTE frame_type;

bool recvZ = 0;


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
u_int8_t GPS_valid[4] = {0,0,0,0};
double IMU_data[3] = {-1,-1,-1}; // Accel XYZ 
u_int8_t IMU_count[3] = {0,0,0};

double lat, lon, altitude, x_acc, y_acc, z_acc, z_ang, timeGyro;
uint16_t alt, xa, ya, za, dmin, zg;

double conv0[3];
double conv1[3];
double conv2[3];
double *conv[3] = {conv0, conv1, conv2};

double a_corr[3];

#define fifoNum 0
#define msgAttr 0

#define KALMAN_X 0
#define KALMAN_Y 1
#define KALMAN_Z 2
#define KALMAN_XV 3
#define KALMAN_YV 4
#define KALMAN_ZV 5
#define KALMAN_XA 6
#define KALMAN_YA 7
#define KALMAN_ZA 8



int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    UART6_Write(&buffer[0], sizeof(buffer));
    CAN2_CallbackRegister(can_msg_handle, (uintptr_t)NULL, 1);
    CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);

    //We live in clown world
    //Message "receive" fHunction just binds memory to message location???
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type);
    CAN2_Rx_Filter_Manual_Config(); //Fix Rx filter mask config cause the MCC function just does it wrong
    
    //timer stuff
    TMR2_Start();
    TMR2_InterruptEnable();
    TMR2_CallbackRegister(timer_2_callback, (uintptr_t)NULL);
   
    
    //CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_GENERAL_BOARD_STATUS, 4, status, 0, 0);
    while ( true )
    {
        if (recvZ){
            recvZ = 0;
            update_rotation_filter(timeGyro, z_ang);
            //sendMsg(timeGyro, get_orientation() , 8);
        }

        if((millis() - last_millis) > MILLIS_STUFF)
        {
            last_millis = millis();
            //sendMsg(69, millis(), 0);
            LATJbits.LATJ3 = !LATJbits.LATJ3; 
        }
        
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ( );
        
        // If we have GPS do KalmanIterate
        if (GPS_valid[0] && GPS_valid[1] && GPS_valid[2] && GPS_valid[3]){
            
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
            double gpsX = 0;
            double gpsY = 0;
            gps_conversion(GPS_data_initial[0], GPS_data_initial[1], GPS_data[0], GPS_data[1], &gpsX, &gpsY);

            // timestamp, GPS_value[0], acc[0] ......
            update_velocity_filter(GPS_time, gpsX, A_corr.data[0], gpsY, A_corr.data[1], GPS_data[2], A_corr.data[2]);

            const double *state = get_state();

            // send data
           //sendMsg(millis(), 69 , 8);
            
            for(int i = 0; i < 9; i++)
            {
                uint32_t state_timestamp = millis();
                while(millis() - state_timestamp < 5) {}
                sendMsg(state[i], state_timestamp, i);
            }
            
            
            
            
            // Clear valid bits and zero the data if needed
            IMU_count[0] = 0;
            IMU_count[1] = 0;
            IMU_count[2] = 0;

            GPS_valid[0] = 0;
            GPS_valid[1] = 0;
            GPS_valid[2] = 0;
            GPS_valid[3] = 0;
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
    //sendMsg((double)1, 1, 0);

    //might need to filter messages coming from the same board
    uint16_t msg_id = id & 0x7E0; //grab msg SID from global var which should have been populated by the interrupt handler
    
    //sendMsg(9999, 69, 1);
    
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
            GPS_valid[3] = 1;
            break;
        case MSG_GPS_LATITUDE:
            // deciminute is 4 digits after minute
            // current data reading
            lat = can_rx_buffer[3] * 60 + can_rx_buffer[4];
            dmin = (((u_int16_t)can_rx_buffer[5]) << 8) | (u_int16_t)can_rx_buffer[6];
            lat += dmin*0.001;

            GPS_data[0] = lat;

            // Record initial
            if (GPS_data_initial[0] == -1){
                GPS_data_initial[0] = GPS_data[0];
            }
            GPS_valid[0] = 1;
            break;
        case MSG_GPS_LONGITUDE:
            // deciminute is 4 digits after minute
            // current data reading
            lon = can_rx_buffer[3] * 60 + can_rx_buffer[4];
            dmin = (((u_int16_t)can_rx_buffer[5]) << 8) | (u_int16_t)can_rx_buffer[6];
            lon += dmin*0.001;

            GPS_data[1] = lon;

            // Record initial
            if (GPS_data_initial[1] == -1){
                GPS_data_initial[1] = GPS_data[0];
            }
            GPS_valid[1] = 1;
            break;
        case MSG_GPS_ALTITUDE:
            alt = (((uint16_t)can_rx_buffer[3] << 8 | (uint16_t)can_rx_buffer[4]));
            altitude = alt + 0.01*(can_rx_buffer[6]);
            if (GPS_data_initial[2] == -1){
                GPS_data_initial[2] = altitude;
            }
            GPS_data[2] = altitude - GPS_data_initial[2];
            GPS_valid[2] = 1;
            break;

        // ICM-20948
        // g
        case MSG_SENSOR_ACC:
            // To m/s^2
            xa = (((uint16_t)can_rx_buffer[2] << 8 | (uint16_t)can_rx_buffer[3]));
            ya = (((uint16_t)can_rx_buffer[4] << 8 | (uint16_t)can_rx_buffer[5]));
            za = (((uint16_t)can_rx_buffer[6] << 8 | (uint16_t)can_rx_buffer[7]));
            x_acc = xa*9.81/2048; // +-16g
            y_acc = ya*9.81/2048; 
            z_acc = za*9.81/2048; 
            IMU_data[0] += x_acc;
            IMU_data[1] += y_acc;
            IMU_data[2] += z_acc;
            IMU_count[0] ++;
            IMU_count[1] ++;
            IMU_count[2] ++;
            break;
        
        // dps
        case MSG_SENSOR_GYRO:
            // Timestamp
            zg = ((uint16_t)can_rx_buffer[6] << 8 | (uint16_t)can_rx_buffer[7]);
            z_ang = to_radians((double)zg/16.4); // +-2000 dps to radians             
            // dps to rps

            timeGyro = ((u_int16_t)can_rx_buffer[0] << 8 | (uint16_t)can_rx_buffer[1])*0.001;
            recvZ = 1;

            break;
    }
    
    CAN2_MessageReceive(&id, &length, can_rx_buffer, &timestamp, 1, &frame_type); //this is cursed. Doing this prevents a runtime error. Do not ask me why we have to rebind the same memory addresses to the same locations
    
}

void timer_2_callback (uint32_t status, uintptr_t context)
{
    static uint8_t internal_count = 0;

    millis_counter += MILLIS_INCREMENT;
    internal_count += MILLIS_REMAINDER;
    if (internal_count > MILLIS_INCREMENT_CAP) {
        internal_count -= MILLIS_INCREMENT_CAP;
        millis_counter++;
    }
}

uint32_t millis(void) {
    TMR2_InterruptDisable();
    uint32_t res = millis_counter;
    TMR2_InterruptEnable();
    return res;
}

void sendMsg(double time, double message, u_int8_t datatype){

    const u_int8_t len = 7;

    u_int8_t data[len];
    
    time *= 1000;

    // 24-bit timestamp in milliseconds
    // Top 8 bits are left empty
    u_int32_t wholetime = time;

    data[0] = (wholetime >> 16) & 0xff;     // 00000000 (01234567) 01234567  01234567
    data[1] = (wholetime >> 8) & 0xff;      // 00000000  01234567 (01234567) 01234567
    data[2] = (wholetime >> 0) & 0xff;      // 00000000  01234567  01234567 (01234567)

    // 4 digits behind dec point
    message *= 1000;
    int32_t msg = message;

    data[3] = (msg >> 24) & 0xff;
    data[4] = (msg >> 16) & 0xff;
    data[5] = (msg >> 8) & 0xff;
    data[6] = (msg >> 0) & 0xff;


    switch (datatype) {
        case KALMAN_X:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_X, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_Y:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_Y, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_Z:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_Z, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_XV:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_XV, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_YV:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_YV, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_ZV:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_ZV, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_XA:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_XA, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_YA:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_YA, len, data, fifoNum, msgAttr);
            break;
        case KALMAN_ZA:
            CAN2_MessageTransmit(BOARD_UNIQUE_ID | MSG_STATE_EST_ZA, len, data, fifoNum, msgAttr);
            break;
    }

}

