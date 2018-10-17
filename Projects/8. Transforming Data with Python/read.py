import pandas as pd

def load_data():
	hn_stories = pd.read_csv("hn_stories.csv")
	hn_stories.columns = ["submission_time","upvotes","url","headline"]
	return hn_stories


if __name__ == "__main__":
	print("Welcome to a Python script!")
	load_data()
