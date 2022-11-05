#define ENCODER_OPTIMIZE_INTERRUPTS
#include <Encoder.h>

/*
Please keep in mind that performance changes depending on
whether or not you're using interrupt pins. Just look at the
datasheet if unclear about it.
*/
const int inputA = 2;
const int inputB = 3;

// there are no constraints on the output pin
const int outputPin = 12;

// initialize pins and return Encoder object
Encoder setup_encoder() {
  pinMode(inputA, INPUT);
  pinMode(inputB, INPUT);
  pinMode(outputPin, OUTPUT);

  Encoder enc(inputB, inputA);

  return enc;
}

/*
Call by reference the encoder and the oldPosition, which will
be overwritten with each loop
*/
int32_t encoder_position(Encoder &enc, int32_t &oldPosition) {
  int32_t currentPosition = enc.read();
  if (currentPosition != oldPosition)
    oldPosition = currentPosition;
  return currentPosition;
}