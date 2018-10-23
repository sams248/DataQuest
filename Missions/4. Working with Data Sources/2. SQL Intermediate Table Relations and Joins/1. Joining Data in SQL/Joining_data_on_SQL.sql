/*We'll use a version of the CIA World Factbook (Factbook) database. This database has two tables, one table called facts, where each row represented a country from the Factbook, and another table, called cities which contains information on major urban areas from countries in the Factbook*/


/*Write a query that returns all columns from the facts and cities tables. Use an INNER JOIN to join the cities table to the facts table. o Join the tables on the values where facts.id and cities.facts_id are equal. o Limit the query to the first 10 rows*/

SELECT * FROM facts
INNER JOIN cities 
ON facts.id = cities.facts_id
LIMIT 10;


/*Write a query that: joins cities to facts using an INNER JOIN, uses aliases for table names, and includes, in order: all columns from cities, the name column from facts aliased to country_name. Include only the first 5 rows*/

SELECT c.*, f.name AS country_name
FROM cities AS c
INNER JOIN facts AS f
ON c.facts_id = f.id
LIMIT 5;


/*Write a query that returns, in order: a column of country names, called country, a column of each country's capital city, called capital_city. Use an INNER JOIN to join the two tables in your query*/

SELECT f.name AS country, c.name AS capital_city
FROM facts AS f
INNER JOIN cities AS c
ON f.id = c.facts_id
WHERE c.capital = 1;


/*Write a query that returns the countries that don't exist in cities. Your query should return two columns: the country names, with the alias country and the country population. Use a LEFT JOIN to join cities to facts. Include only the countries from facts that don't have a corresponding value in cities*/

SELECT f.name AS country, f.population
FROM facts AS f
LEFT JOIN cities AS c
ON c.facts_id = f.id
WHERE c.name IS NULL;


/*Write a query that returns the 10 capital cities with the highest population ranked from biggest to smallest population. Include the following columns, in order: capital_city, the name of the city; country, the name of the country the city is from; population, the population of the city*/

SELECT c.name capital_city, f.name country, c.population population
FROM facts f
INNER JOIN cities c
ON c.facts_id = f.id
WHERE c.capital = 1
ORDER BY 3 DESC
LIMIT 10;


/*Using a join and a subquery, write a query that returns capital cities with populations of over 10 million ordered from largest to smallest. Include the following columns: capital_city - the name of the city, country - the name of the country the city is the capital of, population - the population of the city*/

SELECT c.name capital_city, f.name country, c.population population
FROM facts f
INNER JOIN (SELECT * FROM cities WHERE cities.capital = 1) c
ON c.facts_id = f.id
WHERE c.population > 10000000
ORDER BY 3 DESC;


/*Write a query to find the countries where the urban center (city) population is more than half of the country's total population. The query should include the following columns, in order: country, the name of the country, urban_pop, the sum of the population in major urban areas belonging to that country, total_pop, the total population of the country, urban_pct, the percentage of the population within urban areas, calculated by dividing urban_pop by total_pop. Only countries that have an urban_pct greater than 0.5. Rows should be sorted by urban_pct in ascending order*/

SELECT f.name country, c.urban_pop, f.population total_pop, (c.urban_pop / CAST(f.population AS float)) urban_pct
FROM facts f
INNER JOIN (
	SELECT facts_id, SUM(population) urban_pop
	FROM cities
	GROUP BY 1
		   ) c
ON c.facts_id = f.id
WHERE urban_pct > 0.5
ORDER BY 4 ASC;