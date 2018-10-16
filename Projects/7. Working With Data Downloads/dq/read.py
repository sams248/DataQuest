import sys

if __name__ == "__main__":
    print("Program executed successfully!")

import pandas as pd
content= pd.read_csv("./data/CRDC2013_14content.csv", encoding="Latin-1")
print(content.head(3))
