#include <math.h>
#include "kalman_lib.h"
#include <stdio.h>

double to_radians(double angle) {
    return angle * M_PI / 180.0;
}

struct Vector gps_conversion(double lat1, double long1, double lat2, double long2) {
    // Delta x and y
    double delta_y = lat2 - lat1;
    double delta_x = long2 - long1;

    // 1 degree latitude is always 111.32 km
    double y_disp = delta_y * 111.32;

    // 1 degree of longitude depends on current latitude
    // Earth's circumference is 40,075 km
    double km_per_long = 40075 * cos(to_radians(lat2)) / 360;
    double x_disp = delta_x * km_per_long;

    // Return x and y displacement as a vector
    double displacement[2] = {x_disp*1000, y_disp*1000};
    return (struct Vector) {displacement, 2};
}

// Test
int main() {
    double lat1 = 50.0;
    double long1 = -170.3;
    double lat2 = 50.01;
    double long2 = -170.29;

    struct Vector result = gps_conversion(lat1, long1, lat2, long2);

    printf("x = %lf, y = %lf\n", result.data[0], result.data[1]); 

    return 0;
}
