--Task1
SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE e.FirstName LIKE 'Sa%'

--Task2
SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE e.LastName LIKE '%ei%'

--Task3
SELECT e.FirstName
FROM Employees AS e
WHERE e.DepartmentID IN (3, 10)
AND YEAR(e.HireDate) BETWEEN 1995 AND 2005

--Task4
SELECT e.FirstName, e.LastName
FROM Employees AS e
WHERE NOT e.JobTitle LIKE '%engineer%'

--Task5
SELECT t.Name
FROM Towns AS t
WHERE LEN(t.Name) IN(5,6)
ORDER BY t.Name

--Task6
SELECT t.Name
FROM Towns AS t