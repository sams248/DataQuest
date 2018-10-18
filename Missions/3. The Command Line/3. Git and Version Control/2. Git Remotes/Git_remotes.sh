#!/bin/bash

#cd into the /home/dq/chatbot folder to navigate to the chatbot repo
cd ~/dq/chatbot
git init

#add the line This project needs no installation to the bottom of README.md.
echo -e "This project needs no installation" >> README.md

#add your changes to the staging area using git add
git add .

#commit your changes
git commit -m "Updates README.md"

#see the status of the repo
git status

#see all of the branches that exist in the chatbot repo
git branch

#push the master branch of the local chatbot repo to the remote origin
git push origin master

#find the commit hash corresponding to the most recent commit in the chatbot repo
git log

#edit README.md
echo -e "I am adding a new line!" >> README.md

#find the difference between your two commits
diff

#find the commit hash corresponding to the oldest commit in the chatbot repo
git log

#reset the chatbot repo to the oldest commit
git reset --hard 7ddb99

#plore README.md and see what text it contains
head README.md 

#pull the latest commits from the chatbot remote repo
git pull

#reset the chatbot repo to the second most recent commit
git reset --hard HEAD~1

#find the commit hash corresponding to the most recent commit
git rev-parse HEAD
