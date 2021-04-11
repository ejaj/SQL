--Problem Statement
/*

A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

Input Format

The STATION table is described as follows:


*/

--Solution

SET @rowIndex := -1;
SELECT ROUND(AVG(t.LAT_N), 4) FROM
(
SELECT @rowIndex := @rowIndex+1 AS rowIndex, s.LAT_N FROM STATION AS s ORDER BY s.LAT_N
) AS t
WHERE t.rowIndex IN (FLOOR(@rowIndex / 2), CEIL(@rowIndex / 2));
