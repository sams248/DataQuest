#/bin/bash

#create a folder named random_numbers
mkdir random_numbers

#navigate into this folder and initialize a Git repository
cd random_numbers
git init

#check the contents of the random_numbers folder
ls -al

#create a file named README.md with the following content: Random number generator
echo -e "Random number generator" > README.md

#create a file named script.py with this content: if __name__ == "__main__": print("10")
echo -e 'if __name__ == "__main__":\n	print("10")' > script.py

#check the status of the repo
git status

#add script.py to the staging area
git add script.py

#add README.md to the staging area
git add README.md

#configure Git with your email address and name
#git config --global user.email "my_email_address!"
#git config --global user.name "Sam"

#make the first commit to the repository with an informative message
git commit -m "Initial commit. Added script.py and README.md"

#modify script.py so that it prints a random integer from 0 to 10
echo -e 'import random\nif __name__ == "__main__":\n    print(random.randint(0,10))' > script.py

#see how Git is tracking modifications
git diff

#see the status of the file you modified
git status

#add the script.py file to the staging area, then make a new commit with an informative message
git add script.py
git commit -m "Made the numbers random"

#explore the commit history of the repository
git log
git log --stat

#exit the screen once you've finished exploring
q


