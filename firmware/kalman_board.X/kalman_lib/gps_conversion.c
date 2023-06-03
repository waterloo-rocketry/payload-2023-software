#include "gps_conversion.h"

double to_radians(double angle) {
    return angle * 3.14159265 / 180.0;
}

void gps_conversion(double lat1, double long1, double lat2, double long2, double* resX, double* resY) {
    // Delta x and y
    double delta_y = lat2 - lat1;
    double delta_x = long2 - long1;

    // 1 degree latitude is always 111.32 km
    double y_disp = delta_y * 111.32;

    // 1 degree of longitude depends on current latitude
    // Earth's circumference is 40,075 km
    double km_per_long = 40075 * cos(to_radians(lat2)) / 360;
    double x_disp = delta_x * km_per_long;

    // Return x and y displacement in the referenced values
    *resX = x_disp*1000;
    *resY = y_disp*1000;
}