#!/usr/bin/env python3
import numpy as np
import sys
import argparse
import yaml
from dynamics import Payload

def n():
  return np.random.normal()

available_outputs = ["t", "ax", "ay", "az", "tau_x", "tau_y", "tau_z", "vx", "vy", "vz", "omega_x", "omega_y", "omega_z", "x", "y", "z", "sensor_x", "sensor_y", "sensor_z", "sensor_omega_x", "sensor_omega_y", "sensor_omega_z", "sensor_ax", "sensor_ay", "sensor_az"]

parser = argparse.ArgumentParser(
  description="Example usage: ./test_data_gen.py visualize_generated_data.yaml > data.csv",
)
parser.add_argument("CONFIG_YAML_FILE", help=f"includes input events and output metrics. Available outputs are {available_outputs}")
args = parser.parse_args()

with open(args.CONFIG_YAML_FILE) as f:
  config = yaml.safe_load(f)

# ensure the config is valid
error = False
if "duration" not in config["inputs"].keys():
  print("Error: duration not defined in inputs")
  error = True
if "dt" not in config["inputs"].keys():
  print("Error: dt not defined in inputs")
  error = True
for key in config["outputs"]:
  if key not in available_outputs:
    print(f"Error: {key} in ouputs is not available")
    error = True
if error:
  sys.exit(1)

# construct events
events = {"t": [], "a": [], "tau": []}

for i, e in enumerate(config["inputs"]["events"]):
  events["t"].append(e["t"])
  events["a"].append(e["a"] if "a" in e.keys() else [0,0,0])
  events["tau"].append(e["tau"] if "tau" in e.keys() else [0,0,0])

events["t"] = np.array(events["t"])

# uses time to sort the a and tau inputs
ascending_idx = events["t"].argsort()
events["t"] = events["t"][ascending_idx]
events["a"] = np.array(events["a"])[ascending_idx]
events["tau"] = np.array(events["tau"])[ascending_idx]

payload = Payload()

# print csv header
line = ""
for o in config["outputs"]:
  line += f"{o},"
print(line[:-1]) # remove trailing comma

dt = config["inputs"]["dt"]
duration = config["inputs"]["duration"]

# initialize persistent variables
t = 0
sim_out = {}

while t < duration:
  t += dt

  # play the events in the config file
  if (t > events["t"]).any():
    j = sum(t > events["t"]) - 1
    payload.control(events["a"][j], events["tau"][j])
  payload.update(dt)

  sensor_Delta, sensor_a, sensor_omega = payload.get_noisy_data()

  sim_out["t"] = t
  sim_out["sensor_x"], sim_out["sensor_y"], sim_out["sensor_z"] = sensor_Delta
  sim_out["x"], sim_out["y"], sim_out["z"] = payload.Delta
  sim_out["vx"], sim_out["vy"], sim_out["vz"] = payload.v
  sim_out["tau_x"], sim_out["tau_y"], sim_out["tau_z"] = payload.tau
  sim_out["omega_x"], sim_out["omega_y"], sim_out["omega_z"] = payload.omega
  sim_out["sensor_omega_x"], sim_out["sensor_omega_y"], sim_out["sensor_omega_z"] = sensor_omega
  sim_out["ax"], sim_out["ay"], sim_out["az"] = payload.a
  sim_out["sensor_ax"], sim_out["sensor_ay"], sim_out["sensor_az"] = sensor_a

  # print specified outputs
  line = ""
  for o in config["outputs"]:
    line += f"{sim_out[o]},"
  print(line[:-1]) # remove trailing comma
