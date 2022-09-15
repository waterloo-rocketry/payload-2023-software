#include <Servo.h> 		// RC controller 
#include "CytronMotorDriver.h" 	// Brushed motor 
#include <Wire.h> 		// I2C for IMU
#include <LSM6.h> 		// Orientation sensing IMU
#include <SPI.h>
#include <SD.h>


// Configure the motor driver.
CytronMD motor(PWM_DIR, 9, 8);  // PWM = Pin 9, DIR = Pin 9.


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
const bool PRINT = false; // debug bool
String filename = "test_2022_04_22.txt"; // SD card filename
File datalog;

void setup() {
  if(PRINT)
    Serial.begin(115200);

  setup_error();
  setup_pwm_read();

  if(!setup_IMU())
    print_error("IMU Disconnected");
}

void loop() {  
  get_rc_command();
  get_motor_speed();
  get_IMU_data();
  get_gps();
  set_motor_speed();
  save_sd_data();
}
