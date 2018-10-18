#!/bin/bash

#clone the repo chatbot from /dataquest/user/git/chatbot to /home/dq/chatbot
cd ~/dq/chatbot
git clone ~/dq/dataquest/user/git/chatbot

#create a branch called feature/king-bot in the repo chatbot and swith to that branch
git checkout -b feature/king-bot

#edit bot.py and add an appropriately kingly print statement at the end of the file
echo -e 'print("I am the king!")' >> bot.py

#commit your changes
git add .
git commit -m "King's message!"

#switch to the master branch
git checkout master

#create a branch called feature/queen-bot in the repo chatbot
git checkout -b feature/queen-bot

#edit bot.py and add an appropriately queenly print statement at the end at the end of the file
echo -e 'print("I am the queen!")' >> bot.py

#commit your changes
git add .
git commit -m "Queen's message!"

#merge feature/king-bot into master
git checkout master
git merge feature/king-bot
git merge feature/queen-bot

#abort the merge, which had conflicts
git merge --abort

#swich to the master branch of the chatbot repo
git checkout master

#merge feature/queen-bot into master
git merge feature/queen-bot

#add the changes to the staging area and commit them with the commit message Fixed conflicts
echo 'print("I am the queen")' > bot.py
git add .
git commit -m "Fixed conflicts"

#push master to the remote
git push origin master

#create (and switch to) a branch called feature/random-printing in the repo chatbot
git checkout -b feature/random-printing

#edit bot.py to add a block that prints one of three random messages at the end
echo -e 'messages = ["message 1", "message 2", "message 3"]\nimport random\nmsg=random.choice(messages)\nprint(msg)' >> bot.py

#commit your changes
git add .
git commit -m "Added random printing!"

#switch to the master branch
git checkout master

#create (and switch to) a branch called feature/dice-roller in the repo chatbot
git checkout -b feature/dice-roller

#edit bot.py to add a block that generates and displays two random numbers at the end
echo -e 'import random\nprint("R1:{0} R2:{1}".format(random.randitn(1,6),random.randint(1,6)))' >> bot.py

#commit your changes
git add . 
git commit -m "Added dice rolling!"

#merge feature/random-printing into master
git checkout master
git merge feature/random-printing

#try merging feature/dice-roller into master
git merge feature/dice-roller

#resolve the merge conflict
echo -e 'import random\nprint("R1: {0},R2: {1}".format(random.randint(1,6),random.randint(1,6)))'

#commit bot.py with the message Resolved multi-line conflict
git add.
git commit -m "Resolved multi-line conflict!"

#push the master branch of chatbot to the remote repo
git push origin master

#switch into the /home/dq/chatbot repo
cd ~/chatbot

#switch to the master branch
git checkout master

#create (and switch to) a branch called feature/more-printing in the repo chatbot
git checkout -b feature/more-printing

#edit bot.py and add multiple lines that print some text
echo -e 'print("More messages here!")\nprint("Thank you!")'

#commit your changes
git add .
git commit -m "Added more printing!"

#switch to the master branch
git checkout master

#create (and swith to) a branch called feature/more-printing-2 in the repo chatbot
git checkout -b feature/more-printing-2

#edit bot.py and add different print statements to the same lines you edited in feature/more-printing
echo -e 'print("New messages here!")\nprint("Thanks")'

#commit your changes
git add .
git commit -m "Even more printing!"

#merge feature/more-printing into master
git checkout master

#try merging feature/more-printing-2 into master
git merge feature/more-printing
git merge feature/more-printing-2

#resolve the conflicts by editing bot.py and keeping the lines you want
echo -e 'print("Best message here!")\nprint("Done!")'

#commit bot.py with the message Resolved multiple conflicts
git add .
git commit -m "Resolved multiple conflicts!"

#push the master branch of chatbot to the remote repo
git push origin master

#switch into the /home/dq/chatbot repo
cd ~/chatbot

#switch to the master branch
git checkout master

#create (and switch to) a branch called feature/remove-bot in the repo chatbot
git checkout -b feature/remove-bot

#delete bot.py
rm bot.py

#commit your changes
commit -m "Bot removed!"

#switch to the master branch
git checkout master

#create (and switch to) a branch called feature/keep-bot in the repo chatbot
git checkout -b feature/keep-bot

#edit bot.py and add a print statement to the end of the file
echo -e 'print("To be or not to be!?")' >> bot.py

#commit your changes with the message Keeping bot.py
git add .
git commit -m "Keeping the bot!"

#merge feature/remove-bot into master
git checkout master

#try merging feature/keep-bot into master
git merge feature/remove-bot
git merge feature/keep-bot

#keep only the files from feature/keep-bot
git checkout --theirs .

#finish the merge by committing with the message Keeping bot.py
git add .
git commit -m "Keeoing bot.py!"

#push the branch master to the remote
git push origin master

#switch into the /home/dq/chatbot repo
cd ~/chatbot

#switch to the master branch
git checkout master

#add the following lines to .gitignore:
#.DS_Store
#*.pyc
echo -e ".DS_Store\n*.pyc" > .gitignore

#commit the changes with the message Added gitignore
git add .
git commit -m "Added gitignore!"

#push the master branch to the remote
git push origin master

#switch into the /home/dq/chatbot repo
cd ~/chatbot

#switch to the master branch
git checkout master

#remove bot.py from the Git cache
git rm -cached bot.py

#commit your changes with the message Removed bot.py. Remember not use git add here, because that would add bot.py back in!
git commit -m "Removed bot.py"

#push the master branch to the remote
git push origin master
