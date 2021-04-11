--Problem Statement
/*
Query the average population of all cities in CITY where District is California.
 */
--Solution

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = "California";