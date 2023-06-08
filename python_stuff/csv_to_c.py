import csv

data_dict = {
    'time_stamp': [],
    'acceleration': [],
    'velocity': [],
    'position': []
    }

with open('ortest2.csv') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        if len(row) == 10:
            data_dict['time_stamp'].append(row[0])
            data_dict['acceleration'].append(row[1:4])
            data_dict['velocity'].append(row[4:7])
            data_dict['position'].append(row[7:10])

newline = ',\n'

print(f'double time_stamps[{len(data_dict["time_stamp"])}] = {{ {newline.join(data_dict["time_stamp"])} }}')

print(f'double accel_data[{len(data_dict["acceleration"])}] = {{ {newline.join([f"{{ {x}, {y}, {z} }}" for x, y, z in data_dict["acceleration"]])} }}')
# print(f'double accel_data[{len(data_dict["velocity"])}] = {{ {newline.join([f"{{ {x}, {y}, {z} }}" for x, y, z in data_dict["velocity"]])} }}')
# print(f'double accel_data[{len(data_dict["position"])}] = {{ {newline.join([f"{{ {x}, {y}, {z} }}" for x, y, z in data_dict["position"]])} }}')
