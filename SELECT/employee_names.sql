--Problem Statement
/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.


The Employee table containing employee data for a company is described as follows:
+-------------+----------+
| Field       | Type     |
+-------------+----------+
| employee_id | int(11)  |
| name        | char(35) |
| months      | int(3)   |
| salary      | int(3)   |
+-------------+----------+
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

*/

--Solution

select name from Employee order by name ASC;