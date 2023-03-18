#ifndef HEALTH_CHECKS_H
#define	HEALTH_CHECKS_H

#include <stdbool.h>

#define BATT_UNDERVOLTAGE_THRESHOLD_mV 3600
#define BATT_OVERVOLTAGE_THRESHOLD_mV 4200
#define OVERCURRENT_THRESHOLD_mA 1500

// Board status checks
// NOTE: These functions will asynchronously send CAN messages upon error

bool check_battery_voltage_error(void);

bool check_bus_current_error(void);

#endif

