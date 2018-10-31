/*We'll be working with a modified version of a database called Chinook. The Chinook database contains information about a fictional digital music shop - kind of like a mini-iTunes store.*/

/*Launch the SQLite shell and create a new database file, new_database.db.
Create a new table, user, with the following columns:
	user_id, with type INTEGER
	first_name, with type TEXT
	last_name, with type TEXT.*/

/*sqlite3 new_database.db*/
CREATE TABLE user (
user_id INTEGER,
first_name TEXT,
last_name TEXT
);
/*.quit*/


/*Launch the SQLite shell, connected to the chinook.db database.
Create a new table, wishlist, with the following columns:
	wishlist_id, with type INTEGER. This column should be the primary key.
	customer_id, with type INTEGER. This column should have a foreign key relationship with the customer_id column from the customer table.
	name, with type TEXT.*/

/*sqlite3 chinook.db*/
CREATE TABLE wishlist (
	wishlist_id INTEGER PRIMARY KEY,
	customer_id INTEGER,
	name TEXT,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
	);


/*Create a new table, wishlist_track:
The table should have the following columns:
	wishlist_id, with type INTEGER.
	track_id, with type INTEGER.
A primary key should be specified, composed of both columns from the table.
Each of the columns should be designated as a foreign key as indicated in the schema diagram.*/

CREATE TABLE wishlist_track (
	wishlist_id INTEGER,
	track_id INTEGER,
	PRIMARY KEY (wishlist_id, track_id),
	FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id)
	FOREIGN KEY (track_id) REFERENCES track(track_id)
	);


/*Add new rows to the wishlist and wishlist_track tables.*/
INSERT INTO wishlist 
VALUES
	(1, 34, "Joaos awesome wishlist"),
	(2, 18, "Amy loves pop");

INSERT INTO wishlist_track 
VALUES
	(1,1158),
	(1,2646),
	(1,1990),
	(2,3272),
	(2,3470);


/*Create a new column, active, in the wishlist table with type NUMERIC.
Create a new column, active, in the wishlist_track table with type NUMERIC.*/

ALTER TABLE wishlist 
ADD COLUMN active NUMERIC;

ALTER TABLE wishlist_track
ADD COLUMN active NUMERIC;


/*Set all values for the active column in the wishlist table to 1.
Set all values for the active column in the wishlist_track table to 1.*/

UPDATE wishlist
SET active = 1;

UPDATE wishlist_id
SET active = 1;

/*Add two new columns, with values, to the invoice table:
	tax, with type NUMERIC.
		The value for all existing rows should be 0.
	subtotal, with type NUMERIC.
		The value for each row should be the same as that row's value for total.
Quit the SQLite shell.*/

ALTER TABLE invoice
ADD COLUMN tax NUMERIC;


ALTER TABLE invoice
ADD COLUMN subtotal NUMERIC;

UPDATE invoice
SET
	tax = 0,
	subtotal = total;

/*quit*/
