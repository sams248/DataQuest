#!/bin/bash

touch beer.txt

echo -e "99 bottles of beer on the wall..." > beer.txt

echo -e "Take one down, pass it around, 98 bottles of beer on the wall..." >> beer.txt

sort -r beer.txt

grep "pass" beer.txt

echo "coffee is almost as good as beer, but I could never drink 99 bottles of it!" > coffee.txt

grep "beer" beer.txt coffee.txt

grep "bottles of" coffee.txt beer.txt

touch beer1.txt
touch beer2.txt

grep "beer" beer?.txt

grep "beer" *.txt

echo -e "import random\nfor i in range(100):\n    print(random.randint(1,10))\n" > rand.py

python rand.py | grep 9

echo -e "All the beers are gone!" >> beer.txt && cat beer.txt

echo "\"Get out of here,\" said Neil Armstrong to the moon people." >> famous_quotes.txt
