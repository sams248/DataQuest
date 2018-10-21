/*We'll be working with a data set on jobs we stored in the recent_grads table of jobs.db. Each row represents a single college major, and contains information about post-graduation employment of students who studied the major*/

/*write a SQL query that returns the first 10 rows from recent_grads*/

SELECT * FROM recent_grads LIMIT 10;

#write a SQL query that returns the majors where females were a minority (only return the Major and ShareWomen columns)

SELECT Major, ShareWomen 
FROM recent_grads 
WHERE ShareWomen < 0.5;

/*write a SQL query that returns: all majors with majority female and all majors had a median salary greater than 50000 (only include the following columns in the results and in this order: Major, Major_category, Median, ShareWomen)*/

SELECT Major, Major_category, Median, ShareWomen
FROM recent_grads
WHERE Median > 50000 and ShareWomen > 0.5;

/*write a SQL query that returns the first 20 majors that either: have a Median salary greater than or equal to 10,000, or have less than or equal to 1,000 Unemployed people (only include the following columns in the results and in this order: Major, Median, Unemployed)*/

SELECT Major, Median, Unemployed 
FROM recent_grads 
WHERE Median >= 10000 and Unemployed <=1000 
LIMIT 20;


/*write a SQL query that returns all majors that: fell under the category of Engineering and either had mostly women graduates or had an unemployment rate below 5.1%, which was the rate in August 2015 (only include the following columns in the results and in this order: Major, Major_category, ShareWomen, Unemployment_rate)*/

SELECT Major, Major_category, ShareWomen, Unemployment_rate
FROM recent_grads
WHERE (Major_category = "Engineering") AND  (ShareWomen > 0.5 OR Unemployment_rate < 0.051);


/*write a query that returns all majors where: ShareWomen is greater than 0.3, and Unemployment_rate is less than .1 (only include the following columns in the results and in this order: Major, ShareWomen, Unemployment_rate). Order the results in descending order by the ShareWomen column.*/

SELECT Major_category, Major, Unemployment_rate
FROM recent_grads
WHERE (Major_category = "Engineering") OR (Major_category = "Physical Sciences") 
ORDER BY Unemployment_rate ASC;