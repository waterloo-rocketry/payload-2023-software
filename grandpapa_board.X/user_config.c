#include "user_config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "usb_app.h"
#include "canlib/mcp2515/mcp_2515.h"

typedef enum {
    CHECK_CHAR,
    CHECK_NUM,
    CHECK_SEMI_COLON,
    CHECK_DATA
} level;

static level check_level = CHECK_CHAR;
static uint8_t set_debug_level = 0;
static uint8_t temp_num = 0;
static bool set_sensor_messages = true;
static bool sid_sent = false;
static char data_to_send[6];
static uint8_t data_index = 2;
static uint8_t num_data_sent = 0;


// save_type used to save what kind of message type is being checked ('G' for debug level, 'S' for sensor message, or 'L' for config)
static char save_type;

// function takes in a message and parses it to see if max_debug_level() or allow_sensor_messages() needs to be changed
void parse_usb_string(const char *input)
{
    // Check for if the input is not NULL, if so: continue parsing the message
    // Else: end function early

    can_msg_t msg;
    char config_msg[80];
    char sensor_check[8];
    char *nullptr;
    data_to_send[0] = '0';
    data_to_send[1] = 'x';
    uint8_t msg_length = 0;
    char char_to_check;
    if (input != NULL) {
        for (uint8_t i = 0; input[i] != '\0'; i++) {
            //handle lowercase letters just like uppercase letters.
            //That is, make them uppercase
            char_to_check = toupper(input[i]);
            switch (check_level) {

                // Case 3: check for if the sid and data being sent is valid (if the message is a CAN message)
                // --> sid contains 1-3 nibbles
                // --> each data value contains 1-2 nibbles
                case CHECK_DATA:
                    if (char_to_check == ',' || char_to_check == ';') {
                        data_index = 2;
                        if (!sid_sent) {
                            sid_sent = true;
                            msg.sid = (int)strtol(data_to_send, &nullptr, 16);
                            data_to_send[4] = 0;
                        } else {
                            msg.data[num_data_sent] = (int)strtol(data_to_send, &nullptr, 16);
                            num_data_sent++;
                        }
                        data_to_send[2] = 0;
                        data_to_send[3] = 0;
                        if (char_to_check == ';')
                            check_level = CHECK_SEMI_COLON;
                        else
                            break;

                    } else if (!sid_sent && data_index < 5) {
                        data_to_send[data_index] = char_to_check;
                        data_index++;
                        break;
                    } else if (num_data_sent < 8 && data_index < 4) {
                        data_to_send[data_index] = char_to_check;
                        data_index++;
                        break;
                    } // @suppress("No break at end of case")

                // Case 2: last check for if there has been a valid message sent
                // --> if parse_usb_string has received a semicolon
                case CHECK_SEMI_COLON:
                    check_level = CHECK_CHAR;
                    if (input[i] == ';') {
                        switch (save_type) {
                            case 'G':
                                set_debug_level = temp_num;
                                break;
                            case 'S':
                                set_sensor_messages = temp_num;
                                break;
                            case 'L':
                                strcpy(sensor_check, "are");
                                if (!allow_sensor_messages())
                                    strcat(sensor_check, " not");
                                msg_length =
                                    sprintf(config_msg,
                                            "Current Config: Max debug level = %d & Sensor messages %s allowed!\r\n",
                                            max_debug_level(), sensor_check);
                                msg_length = strlen(config_msg);
                                usb_app_write_string(config_msg, msg_length);
                                break;
                            case 'M':
                                msg.data_len = num_data_sent;
                                mcp_can_send(&msg);
                                num_data_sent = 0;
                                sid_sent = false;
                                data_to_send[2] = 0;
                                data_to_send[3] = 0;
                                data_to_send[4] = 0;
                                break;
                        }
                    } // @suppress("No break at end of case")

                // Case 1: second check for if there has been a valid message sent
                // --> if parse_usb_string has received a valid number with respect to the char previously received
                case CHECK_NUM:
                    temp_num = char_to_check - '0';
                    if ((temp_num >= 0 && temp_num <= 5 && save_type == 'G')
                        || ((temp_num == 0 || temp_num == 1) && save_type == 'S')) {
                        check_level = CHECK_SEMI_COLON;
                        break;
                    } else
                        check_level = CHECK_CHAR; // @suppress("No break at end of case")

                // Case 0: new instance of checking for valid message sent
                // --> if parse_usb_string has received a char (either 'S' or 'G')
                case CHECK_CHAR:
                    switch (char_to_check) {
                        case 'G':
                            save_type = 'G';
                            check_level = CHECK_NUM;
                            break;
                        case 'S':
                            save_type = 'S';
                            check_level = CHECK_NUM;
                            break;
                        case 'L':
                            save_type = 'L';
                            check_level = CHECK_SEMI_COLON;
                            break;
                        case 'M':
                            save_type = 'M';
                            check_level = CHECK_DATA;
                            break;
                    }
            }
        }
    }
}

// returns the max debug level
uint8_t max_debug_level()
{
    return set_debug_level;
}

// returns if sensor messages are allowed to be printed
// 1 = true (print) and 0 = false (don't print)
bool allow_sensor_messages()
{
    return set_sensor_messages;
}
