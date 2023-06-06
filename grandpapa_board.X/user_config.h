#ifndef USER_CONFIG_H_
#define USER_CONFIG_H_

#include <stdint.h>
#include <stdbool.h>

// Call this function with the characters received over USB.
void parse_usb_string(const char *input);

// Returns the highest level of debug message that is allowed to be printed
// to set this value, send the board the string "G3;" (to set to 3)
uint8_t max_debug_level();

// Returns true if the user wants sensor messages printed over usb
// to set this values, send the board the string "S1;" (to turn sensor messages on)
bool allow_sensor_messages();

#endif
