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
SELECT t.TownID, t.Name
FROM Towns AS t
WHERE LEFT (t.Name, 1) IN ('M', 'K', 'B', 'E')
ORDER BY t.Name

--Task7
SELECT t.TownID, t.Name 
FROM Towns AS t
WHERE LEFT (t.Name, 1) NOT IN ('R', 'B', 'D')
ORDER BY t.Name

--Task8
CREATE VIEW [V_EmployeesHiredAfter2000] AS
SELECT [FirstName], [LastName]
FROM Employees
WHERE YEAR([HireDate]) > 2000

SELECT * FROM [V_EmployeesHiredAfter2000]