Software created for this project: https://docs.google.com/document/d/1HpUZE3fGLMxAEhBfidZGI1UW8_zOHOhGD0Bg-WkCqeI/edit?usp=sharing

The way this software is organized - the file with the same name as the folder - (remotecontrol_test.ino) acts as the main file.

Each other file contains the software required to operate a different device in the system. 
The majority contain functions titles setup_x, get_x, and or/ set_x that are used to control that device from the main file.

Each device needs to be thouroughly independantly tested, and integration tests need to be performed. 




*Additional information* 

RC controller: Spektrum DX5e
RC receiver: OrangeRX 2.4Ghz

Servo commands recieved from OrangeRX reciever are sent intput into Arduino UNO, which then sends them back to the servo motors.
**This may be redundant w/servo motors, but it will be necessary as the motor control interface gets more complicated


Inital RC controller code stolen from: 
https://create.arduino.cc/projecthub/kelvineyeone/read-pwm-decode-rc-receiver-input-and-apply-fail-safe-6b90eb


Project component tracking spreadsheet: *please keep this up to date*
https://docs.google.com/spreadsheets/d/1w2s266TZ0PPDU81SyGsCCDq5ps78rXRAA3cDaBvMYBY/edit#gid=0