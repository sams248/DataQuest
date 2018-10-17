import read
import pandas as pd
import dateutil as dt
import datetime

a = read.load_data()

def dates(x):
	y = dt.parser.parse(x)
	return y.hour

a['hour'] = a['submission_time'].apply(dates)

print(a['hour'].value_counts().head())
