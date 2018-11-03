#!/bin/bash

#Installing PostgreSQL
sudo apt update
sudo apt install postgresql postgresql-contrib

#Switch over to the postgres account on your server
sudo -i -u postgres

#Start the PostgreSQL command line tool by typing psql
psql

#Create a database called bank_accounts
CREATE DATABASE bank_accounts

#List all available databases
\dt

#Exit the psql command line tool
\q

#Start psql and connect to the bank_accounts database
psql -d bank_accounts

#Create a table called deposits in bank_accounts with the following columns:  id, integer, primary key; name, text; amount, float.
CREATE TABLE deposits (
	id integer PRIMARY KEY,
	name text,
	amount float
);

#List all of the tables in bank_accounts
\dt

#Exit psql
\q

#Start psql
psql

#Create a user called sec with the following modifying statements: LOGIN, PASSWORD 'test', CREATEDB.
CREATE ROLE sec WITH LOGIN CREATEDB PASSWORD 'test';

#List all the users
\du

#Exit psql
\q

#Start psql and connect to the bank_accounts database
psql -d bank_accounts

#Grant all privileges on the table deposits to the user sec
GRANT ALL PRIVILEGES ON deposits TO sec;

#List all the privileges for deposits
\dp deposits

#Revoke all privileges on the table deposits from the user sec
REVOKE ALL PRIVILEGES ON deposits FROM sec;

#List all the privileges for deposits
\dp deposits

#Exit psql
\q

#Start psql
psql

#Create a user called aig with the following modifying statements: LOGIN, PASSWORD 'test', SUPERUSER
CREATE ROLE aig WITH LOGIN PASSWORD 'test' SUPERUSER;

#List all the users
\du

#Exit psql
\q
