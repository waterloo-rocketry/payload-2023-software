#include <math.h>
#include <stdio.h>

double gps_conversion(double lat1, double long1, double lat2, double long2) {
    // Radius of the earth in km
    double radius = 6378.13;

    // These calculations come from the Haversine formula
    // https://en.wikipedia.org/wiki/Haversine_formula
    double dlat = ((lat2 * M_PI) / 180) - ((lat1 * M_PI) / 180);
    double dlong = ((long2 * M_PI) / 180) - ((long1 * M_PI) / 180);
    double a = sin(dlat/2) * sin(dlat/2) + cos(lat1*M_PI/180) * 
               cos(lat2*M_PI/180) * sin(dlong/2) * sin(dlong/2);
    double b = 2 * atan2(sqrt(a), sqrt(1-a));
    double c = radius * b;

    // Return the answer in meters
    return c * 1000;
}

int main() {
    double lat1 = 50.0;
    double long1 = -170.3;
    double lat2 = 50.01;
    double long2 = -170.29;

    printf("%lf", gps_conversion(lat1, long1, lat2, long2)); // should be around 1 323 m

    return 0;
}