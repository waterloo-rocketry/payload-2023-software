#ifndef BOARD_H
#define	BOARD_H

#include <stdbool.h>

// Time between main loop code execution
#define MAX_LOOP_TIME_DIFF_ms 1000
// no one has ever done this before, um, double check with jack TODO:
#define BOARD_ID 0x13

void papa_init(void);

void RED_LED_SET(bool value);
void BLUE_LED_SET(bool value);
void WHITE_LED_SET(bool value);

void CAN_5V_SET(bool value);
void POWER_12V_SET(bool value);

#endif	/* BOARD_H */
