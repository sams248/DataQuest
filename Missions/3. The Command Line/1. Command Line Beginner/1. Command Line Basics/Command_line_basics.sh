#!/bin/bash

#switch to the root directory
cd  /

#move into the home folder
cd home

#switch to the root directory
cd ~

#go to the dq folder
cd dq

#check username
whoami

#create a directory called test inside the user's home folder
mkdir test

#create another directory and  check out the verbose option
mkdir -v test2

#see the help contents for the mkdir command
mkdir --help

#see the contents of the user home folder
ls -l

#delete the test2 directory
rmdir test2


