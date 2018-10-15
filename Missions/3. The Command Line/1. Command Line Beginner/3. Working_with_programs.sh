#!/bin/bash

#create a variable FOOD containing the value Shrimp gumbo
FOOD="Shrimp gumbo"

#print the value of the FOOD variable
echo $FOOD

#create an environment variable called FOOD with the value Chicken and waffles
export FOOD="Chicken and waffles"

#fire up the Python interpreter
python

#run some Python code
import os
print(os.environ["FOOD"])

#exit the interpreter
exit()

#verify that the value of the FOOD variable is the same in Python and the shell
echo $FOOD

#get to the Python interpreter by typing its full path
/usr/bin/python

#exit the interpreter
exit()

#see what folders are in PATH
echo $PATH

#list all of the files in long format
ls -al

#ls -al with the --ignore flag to ignore any files named .ipython
ls -al --ignore=.ipython

