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
 int32_t OldPosition = 0;
 int32_t NewPosition = 0;

void loop() {  
  //get_motor_speed();
  //get_IMU_data();
motor.setSpeed(150);
delay(10);
motor.setSpeed(0); 
  NewPosition = encoder_position (enc,OldPosition);
  Serial.println (NewPosition);
  //get_gps();
  //set_motor_speed();
  //save_sd_data();
}


