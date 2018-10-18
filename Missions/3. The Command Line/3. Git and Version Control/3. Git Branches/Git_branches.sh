#!/bin/bash

#clone the repo chatbot from /dataquest/user/git/chatbot to /home/dq/chatbot
cd ~/dq/chatbot
clone /dataquest/user/git/chatbot
git init

#create a branch called more-speech in the repo chatbot, and switch to the branch more-speech
git checkout -b more-speech

#edit bot.py so that it will print more output when it runs
echo -e 'print("This is a new line!")' >> bot.py
git add .

#make a commit with the message Added more output
git commit -m "Added more output"

#push the more-speech branch to the remote origin
git push origin more-speech

#list the branches available on the remote
git branch -r

#switch to the master branch of the chatbot repo
git checkout master

#merge more-speech into master
git merge more-speech

#push master to the remote repo
git push origin master

#delete the more-speech branch
git branch -d more-speech

#simulate a second collaborator working on the remote
cd ~/dq
git clone /dataquest/user/git/chatbot chatbot2
cd chatbot2

#create a new branch called happy-bot
git checkout -b happy-bot

#edit bot.py to output happy messages
echo -e "print('Very very happy!')" >> bot.py

#commit your changes with the message Made the bot 20% happier!
git add .
git commit -m "Made the bot 20% happier!"

#push the happy-bot branch to the remote
git push origin happy-bot

#in your local repo /home/dq/chatbot, check out the branch
cd ~/dq/chatbot

#update the Git history
git fetch

#check out the happy-bot branch
git checkout happy-bot

#run bot.py to make sure the file changed
python bot.py

#use git diff to see the differences between happy-bot and master
git diff master happy-bot

#create a new branch called feature/random-messages
cd ~/dq/chatbot
git checkout -b feature/random-messages

#ebot.py to output one of several possible messages, based on a random number generator
echo -e 'import random\nmessages=["Msg1", "Msg2", "Msg3", "Msg4"]\na=random.randint(1,len(messages))\nprint(messages[n])' >> bot.py

#commit and push your branch to the remote
git add .
git commit -m "Random messages added to the bot!"
git push origin feature/random-messages
