--Problem Statement
/*

Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

Input Format

The STATION table is described as follows:



*/

--Solution


SELECT ROUND(SQRT(POW(MIN(LAT_N)-MAX(LAT_N), 2) + POW(MIN(LONG_W)-MAX(LONG_W), 2)), 4) FROM STATION;
