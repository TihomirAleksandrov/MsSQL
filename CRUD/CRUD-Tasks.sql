--Task2
SELECT * FROM Departments

--Task3
SELECT d.Name FROM Departments AS d

--Task4
SELECT e.FirstName, e.LastName, e.Salary 
FROM Employees AS e

--Task5
SELECT e.FirstName, e.MiddleName, e.LastName
FROM Employees AS e

--Task6
SELECT e.FirstName + '.' + e.LastName + '@softuni.bg' AS 'Full Email Address'
FROM Employees AS e

--Task7
SELECT DISTINCT e.Salary
FROM Employees AS e

--Task8
SELECT *
FROM Employees AS e
WHERE e.JobTitle = 'Sales Representative'

--Task9
SELECT e.FirstName, e.LastName, e.JobTitle 
FROM Employees AS e
WHERE e.Salary BETWEEN 20000 AND 30000

--Task10
SELECT e.FirstName + ' ' + ISNULL(e.MiddleName, '') + ' ' + e.LastName AS 'Full Name'
FROM Employees AS e
WHERE e.Salary = 25000 OR e.Salary = 14000 OR e.Salary = 12500 OR e.Salary = 23600

--Task11
SELECt e.FirstName, e.LastName
FROM Employees AS e
WHERE e.ManagerID IS NULL