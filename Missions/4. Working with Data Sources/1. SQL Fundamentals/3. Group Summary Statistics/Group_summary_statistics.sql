/*We'll be working with a data set on jobs we stored in the recent_grads table of jobs.db. Each row represents a single college major, and contains information about post-graduation employment of students who studied the major.*/

/*write a SQL query that displays all of the columns and the first five rows of the recent_grads table.*/
SELECT *
FROM recent_grads
LIMIT 5;

/*select the following columns and aggregates in a query: Major_category, AVG(ShareWomen). Group the query by the Major_category column*/

SELECT Major_category, AVG(ShareWomen)
FROM recent_grads
GROUP BY Major_category;

/*for each major category, find the percentage of graduates who are employed. Select the following columns and aggregates in your query: Major_category, AVG(Employed) / AVG(Total) as share_employed. Group the query by the Major_category column.

SELECT Major_category, AVG(Employed) / AVG(Total) AS share_employed
FROM recent_grads
GROUP BY Major_category;

/*find all of the major categories where the share of graduates with low-wage jobs is greater than .1. Select the following columns and aggregates in a query: Major_category, AVG(Low_wage_jobs) / AVG(Total) as share_low_wage. Group the query by the Major_category column. Restrict the selection to rows where share_low_wage is greater than .1.*/

SELECT Major_category, AVG(Low_wage_jobs) / AVG(Total) AS share_low_wage
FROM recent_grads
GROUP BY Major_category
HAVING share_low_wage > .1;

/*write a SQL query that returns the following columns of recent_grads (in the same order): ShareWomen rounded to 4 decimal places, Major_category. Limit the results to 10 rows.*/

SELECT ROUND(ShareWomen, 4), Major_category
From recent_grads
LIMIT 10;

/*select the following columns and aggregates in a query: Major_category, AVG(College_jobs) / AVG(Total) as share_degree_jobs. Use the ROUND function to round share_degree_jobs to 3 decimal places. Group the query by the Major_category column. Only select rows where share_degree_jobs is less than .3.*/

SELECT Major_category, ROUND(AVG(College_jobs) / AVG(Total), 3) AS share_degree_jobs
FROM recent_grads
GROUP BY Major_category
HAVING share_degree_jobs < .3;

/*write a query that divides the sum of the Women column by the sum of the Total column, aliased as SW. Group the results by Major_category and order by SW. The results should only contain the Major_category and SW columns, in that order.*/

SELECT Major_category, CAST(SUM(Women) AS Float) / CAST(SUM(Total) AS Float) AS SW
FROM recent_grads
GROUP BY Major_category
ORDER BY SW;