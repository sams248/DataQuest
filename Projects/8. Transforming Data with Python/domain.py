import read
import pandas as pd

a = read.load_data()

domains = a['url'].value_counts()

domains = domains[:99:]

for name, row in domains.items():
	print("{0}: {1}".format(name, row))
