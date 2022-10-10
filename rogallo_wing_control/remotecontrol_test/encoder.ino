#include <Encoder.h>

/*
Please keep in mind that performance changes depending on
whether or not you're using interrupt pins. Just look at the
datasheet if unclear about it.
*/
const int inputA = 5;
const int inputB = 6;

// there are no constraints on the output pin
const int outputPin = 12;

// initialize pins and return Encoder object
Encoder setup_encoder() {
    pinMode(inputA, INPUT);
    pinMode(inputB, INPUT);
    pinMode(outputPin, OUTPUT);

    Encoder enc(5, 6);

    return enc;
}

long encoder_position(Encoder enc, long oldPosition) {
    long currentPosition = enc.read();

    if (currentPosition != oldPosition)
        oldPosition = currentPosition;

    return currentPosition;
}
