#!/bin/bash

cd ..
cd ~/dq

#create a Python script that takes in a command line argument and prints it out
echo -e 'import sys\n\nif __name__ == "__main__":\n    print(sys.argv[1])' > script.py

#edit the file permissions for script.py so that only the current user can access it
chmod 0700 script.py

#create a Python 3 virtualenv called script
virtualenv -p /usr/bin/python3 script

#activate the script virtualenv
source script/bin/activate

#create a folder called printer in the current user's home directory
mkdir printer

#move script.py into the printer folder
mv script.py printer

#change the current directory to the printer directory
cd printer/

#execute script.py, and pass in the string I'm so good at challenges!
python script.py "I'm so good at challenges!"

deactivate
