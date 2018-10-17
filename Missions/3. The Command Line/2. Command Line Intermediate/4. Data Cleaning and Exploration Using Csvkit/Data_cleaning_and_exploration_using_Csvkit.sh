#!/bin/bash

#install Csvkit
pip install csvkit

#merge Hud_2005.csv, Hud_2007.csv, and Hud_2013.csv in that order into one file
csvstack -n year -g 2005,2007,2013 Hud_2005.csv Hud_2007.csv Hud_2013.csv > Combined_hud.csv

#preview the first few rows of Combined_hud.csv
head -5 Combined_hud.csv

#confirm that the merged file contains 154118 rows
wc -l Combined_hud.csv

#use csvlook to preview the first 10 rows from Combined_hud.csv
head -10 Combined_hud.csv | csvlook

#use csvcut to return all of the column names from Combined_hud.csv
csvcut -n Combined_hud.csv

#use csvcut to dispay just the first 10 values in the AGE1 column
csvcut -c 2 Combined_hud.csv | head -10

#use csvstat to calculate just the mean for each column in Combined_hud.csv
csvstat --mean Combined_hud.csv

#use csvstat to calculate the full summary statistics for just the AGE1 column
csvcut -c 2 Combined_hud.csv | csvstat

#display the firs 10 rows from Combined_hud.csv where the value for the AGE1 column is -9 in a pretty table format
csvgrep -c 2 -m -9 Combined_hud.csv | head -10 | csvlook

#select all rows where the value for AGE1 isn't -9 and write just those rows to positive_ages_obly.csv
csvgrep -c 2 -m -9 -i Combined_hud.csv > positive_ages_only.csv

