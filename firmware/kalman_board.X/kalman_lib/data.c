#include "data.h"

/* Kalman Parameters for 2x2 lateral filter */

// process uncertainty
double q0l[2] = {0,0};
double q1l[2] = {0,0};
double* Q_arrl[2] = {q0l, q1l};
struct Matrix Q_lat = (struct Matrix) {Q_arrl, 2, 2};

// Model (aka prediction matrix)
double time_lat = 0;

double f0l[2] = {1,0};
double f1l[2] = {0,1};
double* F_arrl[2] = {f0l, f1l};
struct Matrix F_lat = (struct Matrix) {F_arrl, 2, 2};

// Control Model 
double g0l[1] = {0};
double g1l[1] = {0};
double* G_arrl[2] = {g0l, g1l};
struct Matrix G_lat = (struct Matrix) {G_arrl, 2, 1};

// Input
double u_inpl[1] = {0};
struct Vector u_lat = (struct Vector) {u_inpl, 1};

// Observation Matrix
double h0l[2] = {1,0};
double h1l[2] = {0,1};
double* H_arrl[2] = {h0l, h1l};
struct Matrix H_lat = (struct Matrix) {H_arrl, 2, 2};

// Sensor uncertainty
double r0l[2] = {1,0};
double r1l[2] = {0,1};
double* R_arrl[2] = {r0l, r1l};
struct Matrix R_lat = (struct Matrix) {R_arrl, 2, 2};

// Sensor readings
double z_inpl[2] = {0, 0};
struct Vector z_lat = (struct Vector) {z_inpl, 2};

// Kalman Entity
double x_sl[2] = {0, 0};
struct Vector x_lat = (struct Vector) {x_sl, 2};

double p_cl0[2] = {1, 0};
double p_cl1[2] = {0, 1};
double *p_cl[2] = {p_cl0, p_cl1};
struct Matrix p_lat = (struct Matrix) {p_cl, 2, 2};

// Everything you will actually need for the lateral filter
struct PredictionParameters latPredParams = (struct PredictionParameters) {&F_lat, &Q_lat};
struct ControlParameters latCtrlParams = (struct ControlParameters) {&G_lat, &u_lat};
struct SensorReading latSnsrReadings = (struct SensorReading) {&H_lat, &R_lat, &z_lat};

struct KalmanEntity lateralEntity = (struct KalmanEntity) {&x_lat, &p_lat};

void update_rotation_filter(double new_time, double angular_position, double angular_velocity){
  z_inpl[0] = angular_position;
  z_inpl[1] = angular_velocity;
  f0l[1] = new_time - time_lat;
  time_lat = new_time;

  KalmanIterate(&lateralEntity, latPredParams, latCtrlParams, latSnsrReadings);
}

double get_orientation() { return x_sl[0]; }
double get_angular_velocity() {return x_sl[1]; }



/* Kalman Parameters for 9x9 velocity filter */

// process uncertainty
double q0[9] = {0,0,0,0,0,0,0,0,0};
double q1[9] = {0,0,0,0,0,0,0,0,0};
double q2[9] = {0,0,0,0,0,0,0,0,0};
double q3[9] = {0,0,0,0,0,0,0,0,0};
double q4[9] = {0,0,0,0,0,0,0,0,0};
double q5[9] = {0,0,0,0,0,0,0,0,0};
double q6[9] = {0,0,0,0,0,0,0,0,0};
double q7[9] = {0,0,0,0,0,0,0,0,0};
double q8[9] = {0,0,0,0,0,0,0,0,0};
double* Q_arr[9] = {q0, q1, q2, q3, q4, q5, q6, q7, q8};
struct Matrix Q_vel = (struct Matrix) {Q_arr, 9, 9};

// Model (aka prediction matrix)
/*
* Three diagonal blocks of the form
* 1 t 1\2t^2
* 0 1 t
* 0 0 1
*/
double time_velocity = 0;
double f0[9] = {1,0,0, 0,0,0,0,0,0};  // x
double f1[9] = {0,1,0, 0,0,0,0,0,0};  // v_x
double f2[9] = {0,0,1, 0,0,0,0,0,0};  // a_x
double f3[9] = {0,0,0, 1,0,0, 0,0,0}; // y
double f4[9] = {0,0,0, 0,1,0, 0,0,0}; // v_y
double f5[9] = {0,0,0, 0,0,1, 0,0,0}; // a_y
double f6[9] = {0,0,0,0,0,0, 1,0,0};  // z
double f7[9] = {0,0,0,0,0,0, 0,1,0};  // v_z
double f8[9] = {0,0,0,0,0,0, 0,0,1};  // a_z
double* F_arr[9] = {f0, f1, f2, f3, f4, f5, f6, f7, f8};
struct Matrix F_vel = (struct Matrix) {F_arr, 9, 9};

// Control Model
// we take in the vector [delta a_x, delta a_y, delta a_z]
// and add this to our acceleration values
double g0[3] = {0, 0, 0};
double g1[3] = {0, 0, 0};
double g2[3] = {1, 0, 0};
double g3[3] = {0, 0, 0};
double g4[3] = {0, 0, 0};
double g5[3] = {0, 1, 0};
double g6[3] = {0, 0, 0};
double g7[3] = {0, 0, 0};
double g8[3] = {0, 0, 1};
double* G_arr[9] = {g0, g1, g2, g3, g4, g5, g6, g7, g8};
struct Matrix G_vel = (struct Matrix) {G_arr, 9, 3};

// Input
// [a_x, a_y, a_z]
double u_inp[3] = {0, 0, 0};
struct Vector u_vel = (struct Vector) {u_inp, 3};

void set_control_vector(double dax, double day, double daz) {
  u_inp[0] = dax;
  u_inp[1] = day;
  u_inp[2] = daz;
}

// Observation Matrix
// This code is written assuming we are reading
// position and acceleration in all 3 directions
double h0[9] = {1,0,0,0,0,0,0,0,0};
double h1[9] = {0,0,1,0,0,0,0,0,0};
double h2[9] = {0,0,0,1,0,0,0,0,0};
double h3[9] = {0,0,0,0,0,1,0,0,0};
double h4[9] = {0,0,0,0,0,0,1,0,0};
double h5[9] = {0,0,0,0,0,0,0,0,1};
double* H_arr[6] = {h0, h1, h2, h3, h4, h5};
struct Matrix H_vel = (struct Matrix) {H_arr, 6, 9};

// Sensor Uncertainty
// Covariances assumed to be 0, values
// may be adjusted lated
double r0[6] = {1,0,0,0,0,0};
double r1[6] = {0,1,0,0,0,0};
double r2[6] = {0,0,1,0,0,0};
double r3[6] = {0,0,0,1,0,0};
double r4[6] = {0,0,0,0,1,0};
double r5[6] = {0,0,0,0,0,1};
double* R_arr[6] = {r0, r1, r2, r3, r4, r5};
struct Matrix R_vel = (struct Matrix) {R_arr, 6, 6};

// Sensor readings
double z_inp[6] = {0, 0, 0, 0, 0, 0};
struct Vector z_vel = (struct Vector) {z_inp, 6};

// Kalman Entity
double x_sv[9] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
struct Vector x_vel = (struct Vector) {x_sv, 9};

double p_cv0[9] = {1, 0, 0, 0, 0, 0, 0, 0, 0};
double p_cv1[9] = {0, 1, 0, 0, 0, 0, 0, 0, 0};
double p_cv2[9] = {0, 0, 1, 0, 0, 0, 0, 0, 0};
double p_cv3[9] = {0, 0, 0, 1, 0, 0, 0, 0, 0};
double p_cv4[9] = {0, 0, 0, 0, 1, 0, 0, 0, 0};
double p_cv5[9] = {0, 0, 0, 0, 0, 1, 0, 0, 0};
double p_cv6[9] = {0, 0, 0, 0, 0, 0, 1, 0, 0};
double p_cv7[9] = {0, 0, 0, 0, 0, 0, 0, 1, 0};
double p_cv8[9] = {0, 0, 0, 0, 0, 0, 0, 0, 1};
double *p_cv[9] = {p_cv0, p_cv1, p_cv2, p_cv3, p_cv4, p_cv5, p_cv6, p_cv7, p_cv8};
struct Matrix p_vel = (struct Matrix) {p_cv, 9, 9};

// Everything you will actually need for the velocity filter
struct PredictionParameters velPredParams = (struct PredictionParameters) {&F_vel, &Q_vel};
struct ControlParameters velCtrlParams = (struct ControlParameters) {&G_vel, &u_vel};
struct SensorReading velSnsrReadings = (struct SensorReading) {&H_vel, &R_vel, &z_vel};

struct KalmanEntity velocityEntity = (struct KalmanEntity) {&x_vel, &p_vel};

void update_velocity_filter(double new_time, double x, double a_x, double y, double a_y, double z, double a_z) {
  z_inp[0] = x;
  z_inp[1] = a_x;
  z_inp[2] = y;
  z_inp[3] = a_y;
  z_inp[4] = z;
  z_inp[5] = a_z;
  double delta_t = new_time - time_velocity;
  f0[1] = f1[2] = f3[4] = f4[5] = f6[7] = f7[8] = delta_t;
  f0[2] = f3[5] = f6[8] = (delta_t * delta_t)/2;
  time_velocity = new_time;

  KalmanIterate(&velocityEntity, velPredParams, velCtrlParams, velSnsrReadings);
}

double velocity[3];
double* get_velocity() {
  velocity[0] = x_sv[1];
  velocity[1] = x_sv[4];
  velocity[2] = x_sv[7];

  return velocity;
}

double *get_state() { return x_sv; }
