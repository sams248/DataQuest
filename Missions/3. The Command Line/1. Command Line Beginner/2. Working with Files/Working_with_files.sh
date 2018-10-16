#!/bin/bash

#create a file named test.txt in the user home directory
cd ~
touch test.txt

#echo All bears should juggle into the test.txt file
echo "All bears should juggle" > test.txt

#open test.txt with nano, delete the text in the file, and save the file
nano test.txt

#see the file permissions in the directory
ls -l

#see the file (octal) permissions for the test.txt file
stat test.txt

#modify test.txt so that it has the following permissions: owner-Read,write,and execute; group-Read and write; everyone No permissions.
chmod 0760 test.txt

#move the test.txt file to the test folder
mkdir test
mv test.txt test

#copy test.txt file
cp ~/test/test.txt ~/test/test2.txt

#rename test.txt in the test folder to test_no_extension
mv ~/test/test.txt ~/test/test_no_extension

#remove test2.txt file
rm ~/test/test2.txt

#run a command as the root user
sudo echo "Thee end!" > test.txt
