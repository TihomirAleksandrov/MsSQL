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
