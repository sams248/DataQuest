#!/bin/bash

#create a file, script.py, that Python can execute on the command line in the dq folder
cd ~/dq
touch script.py
echo -e 'if __name__ == "__main__":\n	print("Welcome to a Python script")' > script.py

#run the file on the command line
python script.py

#run the file script.py using Python 3
python3 script.py

#install the requests package
pip install requests

#install virtualenv package
python3 -m pip install --user virtualenv

#create a new virtual environmented named python2
virtualenv python2

#create a virtualenv called python3 in the dq folder that uses Python 3
virtualenv -p /usr/bin/python3 python3

#activate the python3 virtualenv
source python3/bin/activate

#verify that Python 3 is the current Python version
python -V

#check which packages are installed, and their versions
pip freeze

#create a file called utils.py that contains the following code:
#def print_message(): print("Hello from another file!")
echo -e 'def print_message():\n    print("Hello from another file!")' > utils.py

#create new_script.py file that contains the follwoing code
#import utils
#if __name__ == "__main__":
#utils.print_message()
echo -e 'import utils\n\nif __name__ == "__main__":\n    utils.print_message()' > new_script.py

#run python new_script.py
python new_script.py

#access command line arguments
echo -e 'import sys\n\nif __name__ == "__main__":\n    print(sys.argv[1])' > last_script.py
python last_script.py "Helo from the command line"

#deactivate the virtualenv
deactivate
