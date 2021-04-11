--Problem Statement
/*

Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.

Input Format

The STATION table is described as follows:

*/

--Solution

SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);