#include "canlib/can.h"
#include "canlib/can_common.h"
#include "canlib/pic18f26k83/pic18f26k83_can.h"
#include "canlib/message_types.h"
#include "canlib/util/can_tx_buffer.h"

#include "adcc.h"

#include "error_checks.h"
#include "timer.h"


#include <stdlib.h>

//******************************************************************************
//                              STATUS CHECKS                                 //
//******************************************************************************

bool check_battery_voltage_error(void){    //returns mV
    adc_result_t batt_raw = ADCC_GetSingleConversion(channel_VBAT);

    // Vref: 4.096V, Resolution: 12 bits -> raw ADC value is precisely in mV
    uint16_t batt_voltage_mV = (uint16_t)batt_raw;

    if (batt_voltage_mV < BATT_UNDERVOLTAGE_THRESHOLD_mV
            || batt_voltage_mV > BATT_OVERVOLTAGE_THRESHOLD_mV) {

        uint32_t timestamp = millis();
        uint8_t batt_data[2] = {0};
        batt_data[0] = (batt_voltage_mV >> 8) & 0xff;
        batt_data[1] = (batt_voltage_mV >> 0) & 0xff;
        enum BOARD_STATUS error_code = batt_voltage_mV < BATT_UNDERVOLTAGE_THRESHOLD_mV
                ? E_BATT_UNDER_VOLTAGE
                : E_BATT_OVER_VOLTAGE;

        can_msg_t error_msg;
        build_board_stat_msg(timestamp, error_code, batt_data, 2, &error_msg);
        txb_enqueue(&error_msg);

        return false;
    }

    // also send the battery voltage as a sensor data message
    // this may or may not be the best place to put this
    can_msg_t batt_msg;
    build_analog_data_msg(millis(), SENSOR_BATT_VOLT, batt_voltage_mV, &batt_msg);
    txb_enqueue(&batt_msg);

    // things look ok
    return true;
}


bool check_payload_bus_current_error(void){
    adc_result_t sense_raw_mV = ADCC_GetSingleConversion(channel_5V_CURR);
    uint16_t curr_draw_mA = (sense_raw_mV) / 20;

    if (curr_draw_mA > OVERCURRENT_THRESHOLD_mA) {
        uint32_t timestamp = millis();
        uint8_t curr_data[2] = {0};
        curr_data[0] = (curr_draw_mA >> 8) & 0xff;
        curr_data[1] = (curr_draw_mA >> 0) & 0xff;

        can_msg_t error_msg;
        build_board_stat_msg(timestamp, E_BUS_OVER_CURRENT, curr_data, 2, &error_msg);
        txb_enqueue(&error_msg);
        return false;
    }

    // things look ok
    return true;
}

bool check_rocketcan_current_error(void){
    adc_result_t sense_raw_mV = ADCC_GetSingleConversion(channel_VBATT_CURR);
    uint16_t curr_draw_mA = (sense_raw_mV) / 20;

    if (curr_draw_mA > OVERCURRENT_THRESHOLD_mA) {
        uint32_t timestamp = millis();
        uint8_t curr_data[2] = {0};
        curr_data[0] = (curr_draw_mA >> 8) & 0xff;
        curr_data[1] = (curr_draw_mA >> 0) & 0xff;

        can_msg_t error_msg;
        build_board_stat_msg(timestamp, E_BUS_OVER_CURRENT, curr_data, 2, &error_msg);
        txb_enqueue(&error_msg);
        return false;
    }

    // things look ok
    return true;
}
