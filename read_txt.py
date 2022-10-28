
FILENAME = "Gyro Yaw_10_08.txt"
with open(FILENAME) as f:
    line = f.readline()
    lsplit = line.split(',')
    print(lsplit)