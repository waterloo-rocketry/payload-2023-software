#include "data.h"
#include "orientation_conversion.h"
#include <stdio.h>
#include <stdlib.h>

double conv0[3];
double conv1[3];
double conv2[3];
double *conv[3] = {conv0, conv1, conv2};

double a_prev[3];
double x_prev[3];

double a_corr[3];
double x_corr[3];
double dat[9];

int main() {
    printf(
"X Predicted,X Velocity Predicted,X Acceleration Predicted,\
Y Predicted,Y Velocity Predicted,Y Acceleration Predicted,\
Z Predicted,Z Velocity Predicted,Z Acceleration Predicted,\
X True,X Velocity True,X Acceleration True,\
Y True,Y Velocity True,Y Acceleration True,\
Z True,Z Velocity True,Z Acceleration True,\
X Measured, Y Measured, Z Measured,\
X Acceleration Measured, Y Acceleration Measured, Z Acceleration Measured\n"
);
    for (int i = 0; i < 1000; ++i) {

        // Pull 'sensor readings' from files
        double new_time, ap, av;
        scanf("%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf,%lf",
              &new_time, &ap, &av, x_prev, x_prev + 1, x_prev + 2, a_prev, a_prev + 1, a_prev + 2,
              dat, dat+1, dat+2, dat+3, dat+4, dat+5, dat+6, dat+7, dat+8);

        update_rotation_filter(new_time, ap, av);
        double vel_true_dat[3] = {dat[3], dat[4], dat[5]};
        struct Vector vel_true = (struct Vector) {vel_true_dat, 3};

        struct Vector vel = (struct Vector) {get_velocity(), 3};

        // I take it that Angle States are x_sl and you meant to use get_orientation
        struct Matrix Conv = reference_frame_correction(vel, get_orientation(), conv);
            
        struct Vector A_corr = vector_multiplication(Conv, (struct Vector) {a_prev, 3} , a_corr);
        struct Vector X_corr = vector_multiplication(Conv, (struct Vector) {x_prev, 3} , x_corr);

        update_velocity_filter(new_time, x_corr[0], a_corr[0], x_corr[1], a_corr[1], x_corr[2], a_corr[2]);

        const double *state = get_state();

        printf("%f,%f,%f,%f,%f,%f\n", dat[0], dat[1], dat[2], state[0], state[3], state[6]);

        /*

        printf("%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", state[0], state[1], state[2], state[3], state[4], state[5], state[6], state[7], state[8],
               dat[0], dat[1], dat[2], dat[3], dat[4], dat[5], dat[6], dat[7], dat[8],
               x_prev[0], x_prev[1], x_prev[2], a_prev[0], a_prev[1], a_prev[2]);

        */
    }
    
}
