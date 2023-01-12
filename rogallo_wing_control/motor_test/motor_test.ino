/*
This is NOT a remote control testing code.
All remote control content was deleted from
this file, however, file name was not changed
for the sake of simplicity. There is no more
remote control anywhere in this file!!
*/

#include "CytronMotorDriver.h" 	// Brushed motor 
#include <Wire.h> 		// I2C for IMU
#include <LSM6.h> 		// Orientation sensing IMU
#include <SPI.h>
#include <SD.h>
#include <Encoder.h>

// Configure the motor driver.
CytronMD motor(PWM_DIR, 9, 8);  // PWM = Pin 9, DIR = Pin 8.


const bool PRINT = true; // debug bool
const double pulley_dia = 7.0;
int32_t set_dist = 1000; //set point for distance for string to travel

void setup() {
  if(PRINT)
    Serial.begin(115200);
    //setup_error();
    //setup_pwm_read();
    //setup_encoder();

 /* if(!setup_IMU()){
    Serial.println("No IMU");
    //print("IMU not here");
    //print_error("IMU Disconnected");
  }
  */
}

 Encoder enc = setup_encoder ();
/*
 * volatile int8_t SPEED = 0;
volatile bool CALC_PID = false;
int32_t old_pos = 0; 
int32_t prev_error = 0;
int32_t integral = 0;
 */

void loop() {  
  calc_pid(CALC_PID);
  Serial.print("PID Speed:");
  Serial.print(SPEED);
  Serial.print("Current position: ");
  Serial.print(old_pos);
  Serial.print("Previous error: ");
  Serial.print(prev_error);
  Serial.print("Integral: ");
  Serial.print(integral);
  Serial.println();
}
