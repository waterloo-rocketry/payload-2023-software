/*
#include "kalman_lib.h"
#include "orientation_conversion.h"
#include "math.h"
#include <stdio.h>

int main() {
    double pos[3] = {5.0, 5.0, 5.0};
    struct Vector position = {pos, 3};

    double data[3] = {0.0, 0.0, 0.000001};
    struct Vector velocity = {data, 3};

    double angle = 0; // M_PI;

    double conv0[3];
    double conv1[3];
    double conv2[3];
    double *conv[3] = {conv0, conv1, conv2};

    struct Matrix Conv = reference_frame_correction(velocity, angle, conv);
    printf("Rotation Matrix:\n");
    print_matrix(Conv);

    double result[3];
    struct Vector Result = vector_multiplication(Conv, position, result);

    printf("\nOriginal Position:\n");
    print_vector(position);
    printf("\nEstimated Position: \n");
    print_vector(Result);

    return 0;
}
*/