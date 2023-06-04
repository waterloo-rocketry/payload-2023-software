#ifndef _GPSCONV_
#define _GPSCONV_
#include <math.h>

double to_radians(double angle);
void gps_conversion(double lat1, double long1, double lat2, double long2, double* resX, double* resY);
#endif