WELCOME TO PAYLOAD: "NOT QUITE DEPLOYABLE"

Here are all the Payload Project Proposals starting Fall 2023!
https://drive.google.com/drive/folders/1mYM4XVWNkcDOj4MidgKZG7yYtJaxXxV3?usp=sharing


Here is the folder in the google drive where most of our research happens (if you don't have access, and need it, ask!)
https://drive.google.com/drive/folders/1mYM4XVWNkcDOj4MidgKZG7yYtJaxXxV3?usp=sharing
or potentially:
https://drive.google.com/drive/folders/1Cd6_AShmbkWPmAZkzhvAZI7hbHMKju_5?usp=sharing


If you can't find the project you're looking for, make sure to check the branches

CONFLUENCE
https://uwaterloo.atlassian.net/wiki/spaces/ROCKETRY/pages/42574873580/Payload

#Projects Overview
**papa_board**
- Old board whose code we are attempting to steal for the new board. Probably just going to write new code anyway

**kalman-dev**
- Core of state estimation
- It's an extended kalman filter in python designed to pull data on acceleration, angular velocity, position, and heading in all 3 directions
- Will be ported to C and run on the microcontroller on Minisensor

**rogallo_wing_control**
- Software to control the motor to tilt the wing on the flying cube (!!!)
- *Also currently contains the manufacturer's stock code to pull data from our (test) IMU
- 3 fairly standard feedback control loops to tell our motor what voltage to run at, plus code to write commands out to the motor and read in messages from state estimation