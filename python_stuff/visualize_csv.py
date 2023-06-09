#!/usr/bin/env python3
import argparse
import pandas as pd
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser(
  description="Example usage: ./visualize_csv.py data.csv",
)
parser.add_argument("CSV_FILE")
args = parser.parse_args()

data = pd.read_csv(args.CSV_FILE)

fig, axes = plt.subplots(data.shape[1], 1, figsize=(8, 16), dpi=100)

for i in range(data.shape[1]):
  axes[i].plot(data[data.columns[i]])
  axes[i].legend([data.columns[i]])
    
plt.tight_layout()

plt.show()
