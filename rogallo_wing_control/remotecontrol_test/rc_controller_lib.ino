/* modified from pwmread_rcfailsafe.ino from
 * https://create.arduino.cc/projecthub/kelvineyeone/read-pwm-decode-rc-receiver-input-and-apply-fail-safe-6b90eb
 */
 
// PWM input pins
// an array to identify the PWM input pins (the array can be any length) 
// first pin is channel 1, second is channel 2...etc
const int pwm_PIN[]={A0,A1,A2,A3,A4,A5}; 

// The number of pins in pwmPIN that are connected to an RC receiver.  
// When 0, it will automatically update to the number of pins specified in pwmPIN[] after calling Set_pwm_Read().                                      
int RC_inputs = 3;                 
                                                                                  
// Calibration of each RC channel:
//SANWA 6CH 40MHz with corona RP6D1  
//                THR-1   RUD-2   AILE-3  ElEV-4  GEAR-5  AUX1-6
int RC_min[6] = { 1104,   1200,   1196,   1516,   1056,   1088};
int RC_mid[6] = { 1580,   1512,   1536,   1556,   1374,   1084};
int RC_max[6] = { 1944,   1836,   1844,   1816,   1876,   1116};

// fail safe positions
float RC_failsafe[] = {0.00, 0.00, 1, 0.00, -0.25, 0.00};
   
// enter a failsafe position (in the range of -+1) for each RC channel in case radio signal is lost
// if the array is the incorrect length for the number of RC channels, the failsafe will default to neutral i.e. 0. 
// The failsafe tolerances are: 10-330Hz & 500-2500us

/*
 *    GLOBAL PWM DECODE VARIABLES
 */

// calculate the number of input pins (or channels)
const int num_ch = sizeof(pwm_PIN)/sizeof(int); 
// an array to store pulsewidth measurements
volatile int PW[num_ch];                        
// an array used to determine whether a pin has gone low-high or high-low
volatile bool prev_pin_State[num_ch];  
// the time of the current pin change interrupt
volatile unsigned long pci_Time;                 
// an array to store the start time of each PWM pulse
volatile unsigned long pwm_Timer[num_ch];        

// flag whenever new data is available on each pin
volatile bool pwm_Flag[num_ch];               
// flag when all RC receiver channels have received a new pulse
volatile bool RC_data_rdy;                   
// period, mirco sec, between two pulses on each pin
unsigned long pwm_Period[num_ch];                 

// each of the input pins expressed as a position on it's associated port register
unsigned char pwm_PIN_reg[num_ch];                        
// identify which port each input pin belongs to (0 = PORTB, 1 = PORTC, 2 = PORTD)
unsigned char pwm_PIN_port[num_ch];                       

// measure the size of the calibration and failsafe arrays
const int size_RC_min = sizeof(RC_min) / sizeof(int);           
const int size_RC_mid = sizeof(RC_mid) / sizeof(int);
const int size_RC_max = sizeof(RC_max) / sizeof(int);
const int size_RC_failsafe = sizeof(RC_failsafe) / sizeof(float);


//FUNCTION USED TO CALIBRATE RC RECIEVER
float calibrate(float Rx, int Min, int Mid, int Max){
   float calibrated;
   if (Rx >= Mid)
   {
    calibrated = map(Rx, Mid, Max, 0, 1000);  // map from 0% to 100% in one direction
   }
   else if (Rx == 0)
   {
    calibrated = 0;                           // neutral
   }
   else
   {
    calibrated = map(Rx, Min, Mid, -1000, 0); // map from 0% to -100% in the other direction
   }
  return calibrated * 0.001;
}

// FUNCTION USED TO TURN ON THE INTERRUPTS ON THE RELEVANT PINS
void pci_Setup(byte pin){
    // enable pin
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin)); 
    // clear any outstanding interrupt
    PCIFR  |= bit (digitalPinToPCICRbit(pin));
    // enable interrupt for the group
    PCICR  |= bit (digitalPinToPCICRbit(pin));                   
}

// FUNCTION USED TO FIND THE PIN POSITION ON EACH PORT REGISTER: helps the interrupt service routines, ISR, run faster
void pwm_PIN_to_port(){
  for (int i = 0; i < num_ch; i++){

    // determine which port and therefore ISR (PCINT0_vect, PCINT1_vect or PCINT2_vect) each pwmPIN belongs to.
                                                                  // pin belongs to PCINT1_vect (PORT C)
                                                                  pwm_PIN_port[i] = 1;  
                                                                  // pin belongs to PCINT2_vect (PORT D)  
    if (pwm_PIN[i] >= 0 && pwm_PIN[i] <= 7)                         pwm_PIN_port[i] = 2;
                                                                  // pin belongs to PCINT0_vect (PORT B)    
    else if (pwm_PIN[i] >= 8 && pwm_PIN[i] <= 13)                   pwm_PIN_port[i] = 0;    

    // covert the pin number (i.e. pin 11 or pin A0) to the pin position in the port register. There is most likely a better way of doing this using a macro...
    // (Reading the pin state directly from the port registers speeds up the code in the ISR)
    
    if(pwm_PIN[i] == 0 || pwm_PIN[i] == A0 || pwm_PIN[i] == 8)         pwm_PIN_reg[i] = 0b00000001;
    else if(pwm_PIN[i] == 1 || pwm_PIN[i] == A1 || pwm_PIN[i] == 9)    pwm_PIN_reg[i] = 0b00000010;
    else if(pwm_PIN[i] == 2 || pwm_PIN[i] == A2 || pwm_PIN[i] == 10)   pwm_PIN_reg[i] = 0b00000100;
    else if(pwm_PIN[i] == 3 || pwm_PIN[i] == A3 || pwm_PIN[i] == 11)   pwm_PIN_reg[i] = 0b00001000;
    else if(pwm_PIN[i] == 4 || pwm_PIN[i] == A4 || pwm_PIN[i] == 12)   pwm_PIN_reg[i] = 0b00010000;
    else if(pwm_PIN[i] == 5 || pwm_PIN[i] == A5 || pwm_PIN[i] == 13)   pwm_PIN_reg[i] = 0b00100000;
    else if(pwm_PIN[i] == 6)                                         pwm_PIN_reg[i] = 0b01000000;
    else if(pwm_PIN[i] == 7)                                         pwm_PIN_reg[i] = 0b10000000;
    
  }
}

// SETUP OF PIN CHANGE INTERRUPTS

void setup_pwm_read(){
  // run through each input pin
  for(int i = 0; i < num_ch; i++){ 
    // enable pinchange interrupt for pin            
    pci_Setup(pwm_PIN[i]);                        
  }
  // determines the port for each input pin
  // pwm_PIN_to_port() also coverts the pin number in pwm_PIN[] (i.e. pin 11 or pin A0) 
  // to the pin position in the port register (i.e. 0b00000001) for use in the ISR.
  pwm_PIN_to_port();                             
  
  // define the number of pins connected to an RC receiver.
  if(RC_inputs == 0 || RC_inputs > num_ch) RC_inputs = num_ch;                                              
} 

// INTERRUPT SERVICE ROUTINES (ISR) USED TO READ PWM INPUT

// the PCINT0_vect (B port register) reacts to any changes on pins D8-13.
// the PCINT1_vect (C port register)          ""        ""         A0-A5.
// the PCINT2_vect (D port register)          ""        ""         D0-7.

// READ INTERRUPTS ON PINS D8-D13: ISR routine detects which pin has changed, and returns PWM pulse width, and pulse repetition period.

// this function will run if a pin change is detected on portB
ISR(PCINT0_vect){                                                 
  
  // Record the time of the PIN change in microseconds
  pci_Time = micros();                                             

  // run through each of the channels
  for (int i = 0; i < num_ch; i++){   
    // if the current channel belongs to portB
    if (pwm_PIN_port[i] == 0){ 

      // and the pin state has changed from LOW to HIGH (start of pulse)
      if(prev_pin_State[i] == 0 && PINB & pwm_PIN_reg[i]){
        // record pin state          
        prev_pin_State[i] = 1;    
        // calculate the time period, micro sec, between the current and previous pulse                                 
        pwm_Period[i] = pci_Time - pwm_Timer[i];      
        // record the start time of the current pulse               
        pwm_Timer[i] = pci_Time;                                    
      }
      // or the pin state has changed from HIGH to LOW (end of pulse)
      else if (prev_pin_State[i] == 1 && !(PINB & pwm_PIN_reg[i])){ 
        // record pin state
        prev_pin_State[i] = 0;    
        // calculate the duration of the current pulse
        PW[i] = pci_Time - pwm_Timer[i];        
        // flag that new data is available
        pwm_Flag[i] = HIGH;                                        
        if(i+1 == RC_inputs) RC_data_rdy = HIGH;                  
      }
    }
  }
}

// READ INTERRUPTS ON PINS A0-A5: ISR routine detects which pin has changed, and returns PWM pulse width, and pulse repetition period.

// this function will run if a pin change is detected on portC
ISR(PCINT1_vect){                                                 

  // Record the time of the PIN change in microseconds
  pci_Time = micros();                                             

  // run through each of the channels
  for (int i = 0; i < num_ch; i++){
    // if the current channel belongs to portC
    if (pwm_PIN_port[i] == 1){                                     

      // and the pin state has changed from LOW to HIGH (start of pulse)  
      if(prev_pin_State[i] == 0 && PINC & pwm_PIN_reg[i]){  
        // record pin state
        prev_pin_State[i] = 1;  
        // calculate the time period, micro sec, between the current and previous pulse
        pwm_Period[i] = pci_Time - pwm_Timer[i];
        // record the start time of the current pulse                     
        pwm_Timer[i] = pci_Time;                                    
      }
      // or the pin state has changed from HIGH to LOW (end of pulse)
      else if (prev_pin_State[i] == 1 && !(PINC & pwm_PIN_reg[i])){ 
        // record pin state
        prev_pin_State[i] = 0;
        // calculate the duration of the current pulse
        PW[i] = pci_Time - pwm_Timer[i];     
        // flag that new data is available
        pwm_Flag[i] = HIGH;                                         
        if(i+1 == RC_inputs) RC_data_rdy = HIGH;
      }
    }
  }
}

// READ INTERRUPTS ON PINS D0-7: ISR routine detects which pin has changed, and returns PWM pulse width, and pulse repetition period.

// this function will run if a pin change is detected on portD
ISR(PCINT2_vect){                                                 

  // Record the time of the PIN change in microseconds
  pci_Time = micros();                                             

  // run through each of the channels
  for (int i = 0; i < num_ch; i++){    
    // if the current channel belongs to portD
    if (pwm_PIN_port[i] == 2){                                     
      
      // and the pin state has changed from LOW to HIGH (start of pulse)
      if(prev_pin_State[i] == 0 && PIND & pwm_PIN_reg[i]){       
        // record pin state 
        prev_pin_State[i] = 1;
        // calculate the time period, micro sec, between the current and previous pulse
        pwm_Period[i] = pci_Time - pwm_Timer[i];
        // record the start time of the current pulse
        pwm_Timer[i] = pci_Time;                                    
      }
      // or the pin state has changed from HIGH to LOW (end of pulse)
      else if (prev_pin_State[i] == 1 && !(PIND & pwm_PIN_reg[i])){
        // record pin state
        prev_pin_State[i] = 0;
        // calculate the duration of the current pulse
        PW[i] = pci_Time - pwm_Timer[i];
        // flag that new data is available
        pwm_Flag[i] = HIGH;                                        
        if(i+1 == RC_inputs) RC_data_rdy = HIGH;
      }
    }
  }
}

/*
 *  RC OUTPUT FUNCTIONS
 */

 bool rc_avail(){
    bool avail = RC_data_rdy;
    RC_data_rdy = LOW;                          
    // reset the flag
    return avail;
    }

  float rc_decode(int CH){
  
  // if channel number is out of bounds return zero.
  if(CH < 1 || CH > RC_inputs) return 0;     
  
  int i = CH - 1;                     

  // determine the pulse width calibration for the RC channel. The default is 1000, 1500 and 2000us.
  
  int Min;
  if(CH <= size_RC_min) Min = RC_min[CH-1]; else Min = 1000;
  
  int Mid;
  if(CH <= size_RC_mid) Mid = RC_mid[CH-1]; else Mid = 1500;
  
  int Max;
  if(CH <= size_RC_max) Max = RC_max[CH-1]; else Max = 2000;

  float CH_output;

  // If the RC channel is outside of failsafe tolerances (10-330hz and 500-2500uS)      
  if(FAILSAFE(CH) == HIGH){   
    // and if no failsafe position has been defined, set output to neutral                      
      if(CH > size_RC_failsafe) CH_output = 0;   
      // or if defined set the failsafe position   
      else CH_output = RC_failsafe[i];               
  }
  // If the RC signal is valid
  else{
    // calibrate the pulse width to the range -1 to 1.                                             
    CH_output = calibrate(PW[i],Min,Mid,Max);       
  }
  return CH_output;                                 

  // The signal is mapped from a pulsewidth into the range of -1 to +1, using the user defined calibrate() function in this code. 

  // 0 represents neutral or center stick on the transmitter
  // 1 is full displacement of a control input is one direction (i.e full left rudder)
  // -1 is full displacement of the control input in the other direction (i.e. full right rudder)
}


// Basic Receiver FAIL SAFE
// check for 500-2500us and 10-330Hz (same limits as pololu)

bool FAILSAFE(int CH){

   int i = CH-1;
   bool failsafe_flag = LOW;
        
       // if a new pulse has been measured.
       if(pwm_Flag[i] == 1)                             
         {
            // set flag to zero
            pwm_Flag[i] = 0;                            

            // if time between pulses indicates a pulse rate of less than 10Hz
            if(pwm_Period[i] > 100000)                     
            {
              failsafe_flag = HIGH;                       
            }
            // or if time between pulses indicates a pulse rate greater than 330Hz
            else if(pwm_Period[i] < 3000)                  
            {
              failsafe_flag = HIGH;                             
            }

            // if pulswidth is outside of the range 500-2500ms
            if(PW[i] < 500 || PW[i] > 2500)           
            {
              failsafe_flag = HIGH;                        
            }   
         }
        // if there is no new pulswidth measurement within 100ms (10hz)
        else if (micros() - pwm_Timer[i] > 100000)     
        {
          failsafe_flag = HIGH;                      
        }

    return failsafe_flag;   
}

/*
 *  Quick print function of Rx channel input
 */

// display the raw RC Channel PWM Inputs
void print_rc_pwm(){                             
  for (int i = 0; i < RC_inputs; i++){
    //Serial.print(" ch");Serial.print(i+1);
    Serial.print("  ");
    if(PW[i] < 1000) Serial.print(" ");
    Serial.print(PW[i]);
  }
  Serial.println("");
}

void print_decimal_2_percentage(float dec){
  int pc = dec * 100;
  // the number and text will take up 6 charactors i.e ___3%_ or -100%_
  if (pc >= 0) Serial.print(" ");
  if (abs(pc) < 100) Serial.print(" ");
  if (abs(pc) < 10) Serial.print(" ");
  Serial.print(" ");Serial.print(pc);Serial.print("% ");
}

/*
 * GENERIC PWM FUNCTIONS
 */


// when positioning the servos, need to convert the +-100%(+-1) signal to an equivalent pulse wchich in ms
// cmd = commanded position +-100%
// servo = servo num (to apply correct direction, rates and trim)
int calc_uS(float cmd, int servo){                                 
  int i = servo - 1;
  float dir;
  // set the direction of servo travel
  if(servo_dir[i] == 0) dir = -1; else dir = 1;                   
  
  // apply servo rates and sub trim, then convert to a uS value
  cmd = 1500 + (cmd*servo_rates[i]*dir + servo_subtrim[i])*500;   

  // limit pulsewidth to the range 500 to 2500us
  if(cmd > 2500) cmd = 2500;                                      
  else if(cmd < 500) cmd = 500;

  return cmd;
}

bool get_rc_command(){
  
    now = millis();
    
    // if RC data is available or 25ms has passed since last update (adjust to > frame rate of receiver)
    if(rc_avail() || now - rc_update > 25){    
      
      rc_update = now;                           

      if(PRINT)
        print_rc_pwm();                          
      
      // run through each RC channel
      for (int i = 0; i<channels; i++){       
        int CH = i+1;
        
        // decode receiver channel and apply failsafe
        rc_in[i] = rc_decode(CH);             
        
        // uncomment to print calibrated receiver input (+-100%) to serial
        if(PRINT)
          print_decimal_2_percentage(rc_in[i]);          
      }
     // uncomment when printing calibrated receiver input to serial.
     if(PRINT)
      Serial.println(); 
  }
}
