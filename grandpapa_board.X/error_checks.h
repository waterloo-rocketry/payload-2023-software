#ifndef ERROR_CHECKS_H
#define	ERROR_CHECKS_H

#include "canlib/message_types.h"

#include <stdbool.h>

// at this voltage, a warning will be sent out over CAN
#define BATT_UNDERVOLTAGE_THRESHOLD_mV 3500

// at this voltage, a warning will be sent out over CAN
#define BATT_OVERVOLTAGE_THRESHOLD_mV 4300

// From bus line. At this current, a warning will be sent out over CAN
#define OVERCURRENT_THRESHOLD_mA 600

// General board status checkers
bool check_battery_voltage_error(void);
bool is_batt_voltage_critical(void);
bool check_payload_bus_current_error(void);
bool check_rocketcan_current_error(void);

#endif	/* ERROR_CHECKS_H */

