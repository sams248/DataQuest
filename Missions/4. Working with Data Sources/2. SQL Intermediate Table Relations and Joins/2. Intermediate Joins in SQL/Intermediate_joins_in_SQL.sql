/*We'll be working with a modified version of a database called Chinook. The Chinook database contains information about a fictional digital music shop - kind of like a mini-iTunes store.*/

/*Write a query that gathers data about the invoice with an invoice_id of 4. Include the following columns in order:
the id of the track, track_id,
the name of the track, track_name,
the name of media type of the track, track_type,
the price that the customer paid for the track, unit_price,
the quantity of the track that was purchased, quantity.*/

SELECT t.track_id, t.name track_name, m.name track_type, il.unit_price, il.quantity
FROM invoice_line AS il
INNER JOIN track AS t
ON t.track_id = il.track_id
INNER JOIN media_type as m
ON m.media_type_id = t.media_type_id
WHERE il.invoice_id = 4;


/*Add a column containing the artists name to the previous query.
The column should be called artist_name.
The column should be placed between track_name and track_type.*/

SELECT t.track_id, t.name track_name, a.name artist, m.name track_type, il.unit_price, il.quantity
FROM invoice_line AS il
INNER JOIN track AS t
ON t.track_id = il.track_id
INNER JOIN album
ON album.album_id = t.album_id
INNER JOIN artist AS ar
ON ar.artist_id = album.artist_id
INNER JOIN media_type as m
ON m.media_type_id = t.media_type_id
WHERE il.invoice_id = 4;


/*Write a query that returns the top 5 albums, as calculated by the number of times a track from that album has been purchased. Your query should return the following columns, in order:
	album, the title of the album
	artist, the artist who produced the album
	tracks_purchased the total number of tracks purchased from that album
Your query should list the albums from most tracks purchased to least tracks purchased.*/

SELECT a.title, ar.name artist, s.tracks_purchased
FROM artist ar
INNER JOIN album a
ON a.artist_id = ar.artist_id
INNER JOIN
	(
	SELECT t.album_id, SUM(il.quantity) tracks_purchased
	FROM track t
	INNER JOIN invoice_line il
	ON il.track_id = t.track_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 5
	) s
ON s.album_id = a.album_id;


/*Write a query that returns information about each employee and their supervisor. Your query should return the following columns, in order:
	employee_name - containing the first_name and last_name columns separated by a space, eg Luke Skywalker
	employee_title - the title of that employee
	supervisor_name - the first and last name of the person the employee reports to, in the same format as employee_name
	supervisor_title - the title of the person the employee reports to
The report should include employees even if they do not report to another employee.
The report should be sorted alphabetically by the employee_name column.*/

SELECT (e1.first_name || " " || e1.last_name) employee_name, e1.title employee_title, (e2.first_name || " " || e2.last_name) supervisor_name, e2.title supervisor_title
FROM employee e1
LEFT JOIN employee e2
ON e1.reports_to = e2.employee_id
ORDER BY 1;


/*Write a query that finds the contact details a customer with a first_name containing Belle from the database.
Your query should include the following columns, in order:
first_name
last_name
phone*/

SELECT c.first_name, c.last_name, c.phone
FROM customer c
WHERE first_name LIKE "%belle%";

/*Write a query that summarizes the purchases of each customer. Your query should include the following columns, in order:
customer_name - containing the first_name and last_name columns separated by a space, eg Luke Skywalker.
number_of_purchases, counting the number of purchases made by each customer.
total_spent - the sum of customers total purchases made by each customer.
customer_category - a column that categorizes the customer based on their total purchases. The column should contain the following values:
	small spender - If the customer's total purchases are less than $40.
	big spender - If the customer's total purchases are greater than $100.
	regular - If the customer's total purchases are between $40 and $100 (inclusive).
Order your results by the customer_name column.*/

SELECT (c.first_name || " " || c.last_name) customer_name, COUNT(i.invoice_id) number_of_purchases, SUM(i.total) total_spent,
CASE
	WHEN SUM(i.total) < 40 THEN 'small spender'
	WHEN SUM(i.total) > 100 THEN 'big spender'
	ELSE "regular"
	END
	AS customer_category
FROM invoice i
INNER JOIN customer c
ON i.customer_id = c.customer_id
GROUP BY 1
ORDER BY 1;