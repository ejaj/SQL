--Problem Statement
/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.


The table is described as follows:
+-------------+--------------+
| Column       | Type        |
+-------------+--------------+
| N            | string(45)  |
| P            | string(45)  |
+-------------+--------------+
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

*/

--Solution

SELECT N, IF(P IS NULL, 'Root', IF(B.N IN (SELECT P FROM BST), 'Inner', 'Leaf')) FROM BST AS B ORDER BY N;

