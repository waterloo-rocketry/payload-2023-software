/*
The sensor outputs provided by the library are the raw
16-bit values obtained by concatenating the 8-bit high and
low accelerometer and gyro data registers. They can be
converted to units of g and dps (degrees per second) using
the conversion factors specified in the datasheet for your
particular device and full scale setting (gain).

Example: An LSM6DS33 gives an accelerometer Z axis reading
of 16276 with its default full scale setting of +/- 2 g. The
LA_So specification in the LSM6DS33 datasheet (page 11)
states a conversion factor of 0.061 mg/LSB (least
significant bit) at this FS setting, so the raw reading of
16276 corresponds to 16276 * 0.061 = 992.8 mg = 0.9928 g.
SDA - A4
SCL - A5
*/
#include "imu_lib.h"


char report[80];

bool setup_IMU()
{
  Wire.begin();

  delay(1500);
  
  IMU_init();

  delay(20);

  for(int i=0;i<32;i++)    // We take some readings...
    {
    Read_Gyro();
    Read_Accel();
    for(int y=0; y<6; y++)   // Cumulate values
      AN_OFFSET[y] += AN[y];
    delay(20);
    }

  for(int y=0; y<6; y++)
  AN_OFFSET[y] = AN_OFFSET[y]/32;
  AN_OFFSET[5]-=GRAVITY*SENSOR_SIGN[5];

  if(PRINT)
  {
    Serial.println("Offset:");
    for(int y=0; y<6; y++)
      Serial.println(AN_OFFSET[y]);
  }

  delay(2000);
 
}

void get_IMU_data()
{
    Read_IMU();
  
    snprintf(report, sizeof(report), "Accel: X: %6d Y: %6d Z: %6d    Gyro: X: %6d Y: %6d Z: %6d, Comp: X: %6d Y: %6d Z: %6d",
    accel_x, accel_y , accel_z,
    gyro_x, gyro_y, gyro_z,
    magnetom_x, magnetom_y, magnetom_z);

  if(PRINT)
    Serial.println(report);

}
