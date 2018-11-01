#Connecting to th database using psycopg2 library

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
cur = conn.cursor()
print(cur)
conn.close()


#Creating a table, notes, in the dq database

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
cur = conn.cursor()
q='''
CREATE TABLE notes (
id integer PRIMARY KEY,
body text,
title text)
'''
cur.execute(q)
conn.close()

#Applying the changes in the transaction to the database

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
cur = conn.cursor()
q='''
CREATE TABLE notes (
id integer PRIMARY KEY,
body text,
title text)
'''
cur.execute(q)
conn.commit()
conn.close()


#Activating the autocommit

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
conn.autocommit = True
cur = conn.cursor()
q='''
CREATE TABLE notes (
id integer PRIMARY KEY,
body text,
title text)
'''
cur.execute(q)
conn.commit()
conn.close()


#Inserting a row into the table

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
cur = conn.cursor()
q='''
INSERT INTO notes VALUES (
1,
'Do more missions on Dataquest.',
'Dataquest reminder')
'''
cur.execute(q)
cur.execute("SELECT * FROM notes;") #selects all of the rows from the notes table
rows = cur.fetchall() #retrieve the results
print(rows)
conn.close()


#Creating a database called income where the owner is the user dq

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
cur = conn.cursor()
conn.autocommit=True
q="CREATE DATABASE income owner dq"
cur.execute(q)
conn.close()

#Deleting the income database

import psycopg2
conn = psycopg2.connect("dbname=dq user=dq")
cur = conn.cursor()
conn.autocommit=True
q="DROP DATABASE income;"
cur.execute(q)
conn.close()

