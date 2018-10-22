/*We'll be working with a data set on jobs we stored in the recent_grads table of jobs.db. Each row represents a single college major, and contains information about post-graduation employment of students who studied the major*/

/*write a query that returns the majors that are below the average for Unemployment_rate. The results should: only contain the Major and Unemployment_rate columns, and be sorted in ascending order by Unemployment_rate*/

SELECT Major, Unemployment_rate
FROM recent_grads
WHERE Unemployment_rate < (SELECT AVG(Unemployment_rate) FROM recent_grads)
ORDER BY Unemployment_rate;

/*write a SQL statement that computes the proportion (as a float value) of rows that contain above average values for the ShareWomen. The results should only return the proportion, aliased as proportion_abv_avg*/

SELECT CAST(COUNT(*) AS float)/CAST((SELECT COUNT(*) FROM recent_grads) AS float) proportion_abv_avg
FROM recent_grads
WHERE ShareWomen > (SELECT AVG(ShareWomen) FROM recent_grads);

/*write a query that returns the Major and Major_category columns for the rows where: Major_category is one of the 5 highest group level sums for the Total column*/

SELECT Major, Major_category
FROM recent_grads
WHERE Major_category IN (SELECT Major_category FROM recent_grads
GROUP BY Major_category
ORDER BY SUM(Total) DESC
LIMIT 5);

/*write a query that returns the average ratio (Sample_size/Total)) for all of the majors. You'll need to cast both columns to the float type. Use the alias avg_ratio for the average ratio*/

SELECT AVG(CAST(Sample_size AS float)/CAST(Total as float)) avg_ratio
FROM recent_grads;

/*write a query that: selects the Major, Major_category, and the computed ratio columns and filters to just the rows where ratio is greater than avg_ratio*/

SELECT Major, Major_category, CAST(Sample_size AS float)/CAST(Total as float) ratio
FROM recent_grads
WHERE ratio > (SELECT AVG(CAST(Sample_size AS float)/CAST(Total as float)) avg_ratio FROM recent_grads);
