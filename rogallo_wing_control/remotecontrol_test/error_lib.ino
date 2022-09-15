uint8_t errorcount = 0;

void setup_error() {
      pinMode(LED_BUILTIN, OUTPUT);
}

void print_error(String message) {
  errorcount++;

  if(PRINT) {
    Serial.print("Error #");
    Serial.print(errorcount);
    Serial.print(":");
    Serial.println();
    Serial.println(message);
  }

  for(int i = 0; i < errorcount; i++) {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(1000);                     
    digitalWrite(LED_BUILTIN, LOW);
    delay(1000);
  }
}
