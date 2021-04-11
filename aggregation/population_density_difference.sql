--Problem Statement
/*
Query the difference between the maximum and minimum populations in CITY.
 */
--Solution

SELECT MAX(Population) - MIN(Population) AS PopulationDensityDifference
FROM City;