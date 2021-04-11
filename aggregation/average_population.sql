--Problem Statement
/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
 */
--Solution

SELECT ROUND(AVG(Population)) AS AvgPopulation
FROM City;