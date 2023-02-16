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

--Task12
SELECt e.FirstName, e.LastName, e.Salary
FROM Employees AS e
WHERE e.Salary > 50000
ORDER BY e.Salary DESC

--Task13
SELECT TOP(5) e.FirstName, e.LastName 
FROM Employees AS e
ORDER BY e.Salary DESC

--Task14
SELECt e.FirstName, e.LastName
FROM Employees AS e
WHERE NOT e.DepartmentID = 4

--Task15
SELECt *
FROM Employees AS e
ORDER BY e.Salary DESC, e.FirstName, e.LastName DESC, e.MiddleName

--Task16
CREATE VIEW V_EmployeesSalaries AS
SELECT FirstName, LastName, Salary
FROM Employees

--Task17
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS 'Full Name', JobTitle
FROM Employees

--Task18
SELECT DISTINCT e.JobTitle
FROM Employees AS e