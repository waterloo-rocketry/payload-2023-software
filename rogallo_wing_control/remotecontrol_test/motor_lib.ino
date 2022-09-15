int32_t calc_speed(uint8_t CH){
  float new_speed = 255*rc_in[CH-1];
  if (PRINT) {
    Serial.print("CH2: "); 
    Serial.print(rc_in[2]); 
    Serial.print(rc_in[CH]);
  }

  if (new_speed > 255) new_speed = 10;
  else if (new_speed <-255) new_speed = -10;
  else new_speed = 0;

  return new_speed;
}

void set_motor_speed() {
  // MIXING ON
  if (servo_mix_on == true)
    int16_t new_speed = calc_speed(CHANNEL); 
  
  if (PRINT) {
    Serial.print("Step width: "); 
    Serial.println(new_speed); 
    motor.setSpeed(new_speed);
  }
}

void get_motor_speed() {
  if (PRINT) Serial.println("get motor speed");
}
