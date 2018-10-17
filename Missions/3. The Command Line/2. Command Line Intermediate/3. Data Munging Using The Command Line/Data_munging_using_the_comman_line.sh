#!/bin/bash

cd ~/dq

ls -l

head Hud_2005.csv
head Hud_2007.csv
head Hud_2013.csv

head -1 Hud_2005.csv > combined.csv

wc -l Hud_2005.csv

tail -46853 Hud_2005.csv >> combined.csv

wc -l Hud_2007.csv

tail -42729 Hud_2007.csv >> combined.csv

wc -l Hud_2013.csv

tail -64535 Hud_2013.csv >> combined.csv

head combined.csv

grep '1980-1989' combined.csv | wc -l


