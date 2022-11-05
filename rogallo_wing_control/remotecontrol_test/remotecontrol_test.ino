#include <Servo.h> 		// RC controller 
#include "CytronMotorDriver.h" 	// Brushed motor 
#include <Wire.h> 		// I2C for IMU
#include <LSM6.h> 		// Orientation sensing IMU
#include <SPI.h>
#include <SD.h>
#include <Encoder.h>

// Configure the motor driver.
CytronMD motor(PWM_DIR, 9, 8);  // PWM = Pin 9, DIR = Pin 8.


// Select Servo Direction, Rates and Sub-atrim (the size of each array must match the number of servos)

// Direction: 0 is normal, 1 is reverse
boolean servo_dir[] = {0,1};
// Rates: range 0 to 2 (1 = +-500us (NORMAL), 2 = +-1000us (MAX)): The amount of servo deflection in both directions        
float servo_rates[] = {1,0.5};
// Subtrimrange -1 to +1 (-1 = 1000us, 0 = 1500us, 1 = 2000us): The neutral position of the servo      
float servo_subtrim[] = {0.0,0.0};  
boolean servo_mix_on = true;

// timing variables to update data at a regular interval
unsigned long now;                                          
unsigned long rc_update;

// Receiver variables
const int channels = 3; // receiver channles
float rc_in[channels]; // calibrated inputs from receiver
const uint8_t CHANNEL = 3; // channel to control motor
const bool PRINT = true; // debug bool
String filename = "test_2022_04_22.txt"; // SD card filename
File datalog;



void setup() {
  if(PRINT)
    Serial.begin(115200);
    //setup_error();
  //setup_pwm_read();
  //setup_encoder();

 /* if(!setup_IMU()){
    Serial.println("No IMU");
    //print("IMU nothere");
    //print_error("IMU Disconnected");
  }
  */
}

 Encoder enc = setup_encoder ();
 int32_t OldPosition = 0;
int32_t NewPosition = 0;

void loop() {  
  //get_rc_command();
  //get_motor_speed();
  //get_IMU_data();
motor.setSpeed(50);
delay(10);
motor.setSpeed(0); 
  NewPosition = encoder_position (enc,OldPosition);
  OldPosition = NewPosition;
  Serial.println (NewPosition);
  //get_gps();
  //set_motor_speed();
  //save_sd_data();
}


