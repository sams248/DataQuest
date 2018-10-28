/*We'll be working with a modified version of a database called Chinook. The Chinook database contains information about a fictional digital music shop - kind of like a mini-iTunes store.*/

/*Create a query that shows summary data for every playlist in the Chinook database:
Use a WITH clause to create a named subquery with the following info:
	The unique ID for the playlist.
	The name of the playlist.
	The name of each track from the playlist.
	The length of the each track in seconds.
Your final table should have the following columns, in order:
	playlist_id - the unique ID for the playlist.
	playlist_name - The name of the playlist.
	number_of_tracks - A count of the number of tracks in the playlist.
	length_seconds - The sum of the length of the playlist in seconds.
The results should be sorted by playlist_id in ascending order.*/

WITH playlist_info AS 
(
SELECT p.playlist_id,
	p.name AS playlist_name,
	t.name,
	(t.milliseconds)/1000 length_seconds
FROM playlist AS p
LEFT JOIN playlist_track AS pt
ON p.playlist_id = pt.playlist_id
LEFT JOIN track AS t
ON pt.track_id = t.track_id	
)

SELECT playlist_id,
	playlist_name,
	COUNT(name) number_of_tracks,
	SUM(length_seconds)
FROM playlist_info
GROUP BY 1, 2
ORDER BY 1;


/*Create a view of all customers that live in the USA.*/

CREATE VIEW customer_usa AS
SELECT * FROM customer
WHERE country = "USA";


/*Create a view called customer_gt_90_dollars:
The view should contain the columns from customers, in their original order.
The view should contain only customers who have purchased more than $90 in tracks from the store.
After the SQL query that creates the view, write a second query to display your newly created view.*/

CREATE VIEW customer_gt_90_dollars AS
	SELECT c.* 
	FROM invoice AS i
	INNER JOIN customer AS c
	ON c.customer_id = i.customer_id
	GROUP BY 1
	HAVING SUM(i.total) > 90;

SELECT * FROM customer_gt_90_dollars;


/*Create a table of customers in the USA or have spent more than $90.
The result should contain the columns from customers, in their original order.*/

SELECT * FROM customer_usa
UNION
SELECT * FROM customer_gt_90_dollars;


/*Write a query that works out how many customers that are in the USA and have purchased more than $90 are assigned to each sales support agent. 
For the purposes of this exercise, no two employees have the same name.
Your result should have the following columns, in order:
	employee_name - The first_name and last_name of the employee separated by a space, eg Luke Skywalker.
	customers_usa_gt_90 - The number of customer assigned to that employee that are both from the USA and have have purchased more than $90 worth of tracks.
The result should include all employees with the title "Sales Support Agent", but not employees with any other title.
Order your results by the employee_name column.*/

WITH customers_usa_gt_90 AS 
(
SELECT * FROM customer_usa
UNION
SELECT * FROM customer_gt_90_dollars
)

SELECT 
	e.first_name || " " || e.last_name employee_name,
	COUNT(c.customer_id) customers_usa_gt_90
FROM employee AS e
LEFT JOIN customers_usa_gt_90 AS c
ON c.support_rep_id = e.employee_id
WHERE e.title = "Sales Support Agent"
GROUP BY 1
ORDER BY 1;


/*Write a query that uses multiple named subqueries in a WITH clause to gather total sales data on customers from India:
The first named subquery should return all customers that are from India.
The second named subquery should calculate the sum total for every customer.
The main query should join the two named subqueries, resulting in the following final columns:
	customer_name - The first_name and last_name of the customer, separated by a space, eg Luke Skywalker.
	total_purchases - The total amount spent on purchases by that customer.
The results should be sorted by the customer_name column in alphabetical order.*/

WITH 
customers_india AS
(
SELECT * FROM customer
WHERE country = "India"
),
customer_sales AS
(
SELECT customer_id, SUM(total) AS total
FROM invoice
GROUP BY 1
)

SELECT 
ci.first_name || " " || ci.last_name AS customer_name,
cs.total AS total_purchases
FROM customers_india AS ci
INNER JOIN customer_sales AS cs 
ON cs.customer_id = ci.customer_id
ORDER BY 1;


/*Create a query to find the customer from each country that has spent the most money at our store. Your query should return the following columns, in order:
	country - The name of each country that we have a customer from.
	customer_name - The first_name and last_name of the customer from that country with the most total purchases, separated by a space, eg Luke Skywalker.
	total_purchased - The total dollar amount that customer has purchased.
The rows should be order by the country column in alphabetical order.*/


WITH 
customer_country_purchaces AS
	(
	SELECT
	i.customer_id,
	c.country,
	SUM(i.total) total_purchases
	FROM invoice i
	INNER JOIN customer c
	ON c.customer_id = i.customer_id
	GROUP BY 1,2
	),
	country_max_purchase AS
	(
	SELECT
	country,
	MAX(total_purchases) AS max_purchase
	FROM customer_country_purchaces
	GROUP BY 1
	),
	country_best_customer AS
	(
	SELECT
	cmp.country,
	cmp.max_purchase,
	(
	SELECT ccp.customer_id
	FROM customer_country_purchaces AS ccp
	WHERE ccp.country = cmp.country AND cmp.max_purchase = ccp.total_purchases
	) customer_id
	FROM country_max_purchase cmp
	)

SELECT
	cbc.country country,
	c.first_name || " " || c.last_name AS customer_name,
	cbc.max_purchase total_purchased
FROM customer c
INNER JOIN country_best_customer cbc
ON cbc.customer_id = c.customer_id
ORDER BY 1 ASC;