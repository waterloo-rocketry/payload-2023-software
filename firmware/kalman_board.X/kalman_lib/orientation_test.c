#include "kalman_lib.h"
#include "orientation_conversion.h"
#include "math.h"
#include <stdio.h>

int main() {
    double data[3] = {1.0, 1.0, 1.0};
    struct Vector velocity = {data, 3};

    double angle = M_PI;

    double conv0[3];
    double conv1[3];
    double conv2[3];
    double *conv[3] = {conv0, conv1, conv2};

    struct Matrix Conv = reference_frame_correction(velocity, angle, conv);

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%f\t", Conv.data[i][j]);
        }
        printf("\n");
    }

    return 0;
}