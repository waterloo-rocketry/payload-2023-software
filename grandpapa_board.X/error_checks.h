#ifndef ERROR_CHECKS_H
#define	ERROR_CHECKS_H

#include "canlib/message_types.h"

#include <stdbool.h>

// at this voltage, the actuator will revert to its safe state
#define ACTUATOR_BATT_UNDERVOLTAGE_PANIC_THRESHOLD_mV 9000

// at this voltage, a warning will be sent out over CAN
#define ACTUATOR_BATT_UNDERVOLTAGE_THRESHOLD_mV 9500

// at this voltage, a warning will be sent out over CAN
#define ACTUATOR_BATT_OVERVOLTAGE_THRESHOLD_mV 13000

// From bus line. At this current, a warning will be sent out over CAN
#define ACTUATOR_OVERCURRENT_THRESHOLD_mA 300

// If we don't hear CAN traffic for this long, the actuator will revert to its safe state
#define MAX_CAN_IDLE_TIME_MS 1000

// General board status checkers
bool check_battery_voltage_error(void);
bool is_batt_voltage_critical(void);
bool check_bus_current_error(void);

#endif	/* ERROR_CHECKS_H */

