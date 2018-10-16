import sys
import pandas as pd
data = pd.read_csv("./data/CRDC2013_14.csv", encoding="Latin-1")
data["total_enrollment"] = data["TOT_ENR_M"] + data["TOT_ENR_F"]

all_enrollment = data["total_enrollment"].sum()

for c in data.columns:
    data[c] = pd.to_numeric(data[c], errors="coerce")
    data[c] /= all_enrollment

print(data["total_enrollment"])
