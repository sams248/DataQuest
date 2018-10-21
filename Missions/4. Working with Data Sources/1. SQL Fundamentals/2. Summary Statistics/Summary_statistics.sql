/*We'll be working with a data set on jobs we stored in the recent_grads table of jobs.db. Each row represents a single college major, and contains information about post-graduation employment of students who studied the major*/

/*write a query that returns the number of majors with mostly male students*/

SELECT COUNT(Major)
FROM recenT_grads
WHERE ShareWomen > 0.5;

/*write a query that returns the Engineering major with the lowest median salary. We only want the Major, Major_category, and MIN(Median) columns in the result*/

SELECT Major, Major_category, MIN(Median)
FROM recent_grads
WHERE Major_category = "Engineering";

/*write a query that computes the sum of the Total column. Return only the total number of students integer value.*/

SELECT SUM(Total)
FROM recent_grads;

/*write a query that computes the average of the Total column, the minimum of the Men column, and the maximum of the Women column, in that specific order*/

SELECT AVG(Total), MIN(Men), MAX(Women)
FROM recent_grads;

/*write a query that returns, in the following order: the number of rows as Number of Students, the maximum value of Unemployment_rate as Highest Unemployment Rate*/

SELECT COUNT(*) "Number of Students", MAX(Unemployment_rate) "Highest Unemployment Rate"
FROM recent_grads;

/*write a query that returns the number of unique values in the Major, Major_category, and Major_code columns. Use the following aliases in the following order: For the unique value count of the Major column, use the alias unique_majors. For the unique value count of the Major_category column, use the alias unique_major_categories. For the unique value count of the Major_code column, use the alias unique_major_codes.*/

SELECT COUNT(DISTINCT(Major)) unique_majors, COUNT(DISTINCT(Major_category)) unique_major_categories, COUNT(DISTINCT(Major_code)) unique_major_codes
FROM recent_grads;

/*write a query that computes the difference between the 25th and 75th percentile of salaries for all majors. Return the Major column first, using the default column name. Return the Major_category column second, using the default column name. Return the compute difference between the 25th and 75th percentile third, using the alias quartile_spread. Order the results from lowest to highest and only return the first 20 results.*/

SELECT Major, Major_category, P75th - P25th quartile_spread
FROM recent_grads
ORDER BY quartile_spread ASC
LIMIT 20;