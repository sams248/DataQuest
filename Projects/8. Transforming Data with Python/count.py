import read

from collections import Counter

df = read.load_data()

df1=df['headline']

s = ""

for i in df1:
	s += str(i)+' '

print(Counter(s.lower().split()).most_common(100))
