#ifndef REFERENCE_FRAME_ADJUST
#define REFERENCE_FRAME_ADJUST
#include "kalman_lib.h"

struct Matrix reference_frame_correction(struct Vector velocity, double angle);

#endif

