#include "data.h"
#include <stdio.h>
#include <stdlib.h>

double conv0[3];
double conv1[3];
double conv2[3];
double *conv[3] = {conv0, conv1, conv2};

double a_prev[3];
double x_prev[3];

double a_corr[3];

int main() {
    for (int i = 0; i < 1000; ++i) {

        // Pull 'sensor readings' from files
        double new_time;
        scanf("%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf", &new_time, &ap, &av, x_prev, a_prev, x_prev + 1, a_prev + 1, x_prev + 2, a_prev + 2);

        update_rotation_filter(new_time, ap, av);
        struct Vector vel = (struct Vector) {get_velocity(), 3};
        struct Matrix Conv = reference_frame_correction(vel, get_angle(), conv);
            
        struct Vector A_corr = vector_multiplication(Conv, (struct Vector) {a_prev, 3} , a_corr);
        //struct Vector X_corr = vector_multiplication(Conv, (struct Vector) {x_prev, 3} , x_corr);

        update_velocity_filter(new_time, x_prev[0], a_corr[0], x_prev[1], a_corr[1], x_prev[2], a_corr[2]);

        const double *state = get_state()

        printf("%f,%f,%f,%f,%f,%f,%f,%f,%f\n", state[0], state[1], state[2], state[3], state[4], state[5], state[6], state[7], state[8]);
    }
    
}
