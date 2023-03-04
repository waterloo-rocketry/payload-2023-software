#include "kalman_lib.h"
#include <stdio.h>
#include <stdlib.h>

double Q_arr[2][2] = {{0, 0}, {0, 0}};
double F_arr[2][2] = {{1, 0}, {0, 1}};

void update_model(size_t delta_t) {
    F_arr[0][1] = delta_t;
}

int main(){
    struct KalmanEntity k;
    k.state = {malloc(2 * sizeof(double)), 2};
    k.state.data[0] = k.state.data[1] = x0.data[2] = 0

    k.covariance = {malloc(2 * sizeof(double*)), 2, 2};
    k.covariance.data[0] = malloc(2 * sizeof(double*));
    k.covariance.data[1] = malloc(2 * sizeof(double*));

    k.covariance.data[0][0] = k.covariance.data[1][1] = 1;
    k.covariance.data[1][0] = k.covariance.data[0][1] = 0;

    struct PredictionParameters predParams;
    predParams.model = {F_arr, 2, 2};
    predParams.model = {Q_arr, 2, 2};
}
