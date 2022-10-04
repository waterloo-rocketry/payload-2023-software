#include <Encoder.h>

Encoder enc(5, 6);
const int outputPin = 12;

#if defined(__AVR__) || defined(TEENSYDUINO)
#define REGTYPE unsigned char
#else
#define REGTYPE unsigned long
#endif

void setup() {
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(outputPin, OUTPUT);
}

void loop() {
  volatile int count = 0;
  volatile REGTYPE *reg = portOutputRegister(digitalPinToPort(outputPin));
  REGTYPE mask = digitalPinToBitMask(outputPin);

  while (1) {
    enc.read();
    noInterrupts();
    *reg |= mask;
    count = count + 1;
    *reg &= ~mask;
    interrupts();
  }
}