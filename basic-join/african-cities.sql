--Problem Statement
/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.


*/

--Solution
SELECT City.Name
FROM City, Country
WHERE City.CountryCode = Country.Code AND Continent = 'Africa' ;