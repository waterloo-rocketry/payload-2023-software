#include "kalman_lib.h"
#include <stdio.h>
#include <stdlib.h>

double q0[2] = {0, 0};
double q1[2] = {0,0};
double* Q_arr[2] = {q0, q1};

double f0[2] = {1, 0};
double f1[2] = {0, 1};
double* F_arr[2] = {f0, f1};

double g0[1] = {0};
double g1[1] = {0};
double* G_arr[2] = {g0, g1};

double u_inp[1] = {0};

double h0[2] = {1, 0};
double h1[2] = {0, 1};
double* H_arr[2] = {h0, h1};

double r0[2] = {1, 0};
double r1[2] = {0, 1};
double* R_arr[2] = {r0, r1};
double z_inp[2] = {0, 0};

double time = 0.0;

void update() {
    double new_time;
    scanf("%lf,%lf,%lf", &new_time, z_inp, z_inp + 1);

    F_arr[0][1] = new_time - time;
    time = new_time;
}

int main() {
    struct KalmanEntity k;
    k.state = (struct Vector) {malloc(2 * sizeof(double)), 2};
    k.state.data[0] = k.state.data[1] = 0;

    k.covariance = (struct Matrix) {malloc(2 * sizeof(double*)), 2, 2};
    k.covariance.data[0] = malloc(2 * sizeof(double*));
    k.covariance.data[1] = malloc(2 * sizeof(double*));

    k.covariance.data[0][0] = k.covariance.data[1][1] = 1;
    k.covariance.data[1][0] = k.covariance.data[0][1] = 0;

    struct PredictionParameters predParams;
    struct Matrix model;
    model.data = F_arr;
    model.rows = 2;
    model.columns = 2;
    predParams.model = model; //(struct Matrix) { (double**) F_arr, 2, 2};
    predParams.prediction_uncertainty = (struct Matrix) { Q_arr, 2, 2};

    struct ControlParameters ctrlParams;
    ctrlParams.control_matrix = (struct Matrix) { G_arr, 2, 1};
    ctrlParams.input = (struct Vector) {u_inp, 1};

    struct SensorReading snsrReading;
    snsrReading.sensor_matrix = (struct Matrix) {H_arr, 2, 2};
    snsrReading.sensor_uncertainty = (struct Matrix) { R_arr, 2, 2};
    snsrReading.sensor_reading = (struct Vector) {z_inp, 2};

    for (int i = 0; i < 1000; ++i) {

        printf("%f,%f,%f,%f\n", k.state.data[0], k.state.data[1], z_inp[0], z_inp[1]);

        update();
        KalmanIterate(&k, predParams, ctrlParams, snsrReading);
    }

    free_vector(k.state);
    free_matrix(k.covariance);
}
