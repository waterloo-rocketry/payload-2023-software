#ifndef DATA_H
#define DATA_H
#include "kalman_lib.h"


void update_rotation_filter(double new_time, double angular_position, double angular_velocity);

double get_orientation();
double get_angular_velocity();

void update_velocity_filter(double new_time, double x, double a_x, double y, double a_y, double z, double a_z);

double* get_velocity();

double *get_state();

#endif
