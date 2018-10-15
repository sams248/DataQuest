#!/bin/bash

#display the current directory
pwd

#display a list of files in the current directory, along with each file's metadata
ls -l

#move all of the files that don't have .csv as the file extension to a new folder called problematic
mkdir ~/dq/problematic
mv ~/dq/crime_rates.json ~/dq/problematic/crime_rates.json
mv ~/dq/forest_fires.cssv ~/dq/problematic/forest_fires.cssv
mv ~/dq/legislators ~/dq/problematic/legislators

#change all of the extensions for the files in the problematic folder to .csv
cd problematic
mv crime_rates.json crime_rates.csv
mv forest_fires.cssv forest_fires.csv
mv legislators legislators.csv

#display the files in problematic to confirm.
ls -l

#move the remaining files into the problematic folder.
cd ~/dq
mv nfl.csv problematic/nfl.csv
mv titanic_survival.csv problematic/titanic_survival.csv

#rename the problematic folder to csv_datasets.
mv problematic/ csv_datasets/

#change the permissions for these files so nobody else can mess up the file extensions
chmod 0740 nfl.csv
chmod 0740 titanic_survival.csv
chmod 0740 crime_rates.csv
chmod 0740 forest_fires.csv
chmod 0740 legislators.csv

#display the list of files in the csv_datasets directory to confirm the permissions
ls -l

