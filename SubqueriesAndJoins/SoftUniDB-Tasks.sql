--Task1
SELECT TOP(5) e.EmployeeID, e.JobTitle, e.AddressID, a.AddressText
FROM Employees AS e
INNER JOIN Addresses AS a
ON e.AddressID = a.AddressID
ORDER BY AddressID

--Task2
SELECT TOP(50) e.FirstName, e.LastName, t.Name, a.AddressText
FROM Employees AS e
JOIN Addresses AS a
ON e.AddressID = a.AddressID
JOIN Towns AS t
ON t.TownID = a.TownID
ORDER BY e.FirstName, e.LastName

--Task3
SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name AS 'DepartmentName'
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'
ORDER BY e.EmployeeID

--Task4
SELECT TOP(5) e.EmployeeID, e.FirstName, e.Salary, d.Name AS 'DepartmentName'
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 15000
ORDER BY e.DepartmentID

--Task5
SELECT TOP(3) e.EmployeeID, e.FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID

--Task6
SELECT e.FirstName, e.LastName, e.HireDate, d.Name AS 'DeptName'
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1999-01-01'
AND d.Name IN ('Sales', 'Finance')
ORDER BY e.HireDate

--Task7
SELECT TOP(5) e.EmployeeID, E.FirstName, P.Name AS 'ProjectName'
FROM Employees AS e
JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
WHERE p.StartDate > '2002-08-13'
AND p.EndDate IS NULL

--Task8
SELECT e.EmployeeID, e.FirstName,
CASE
WHEN YEAR(p.StartDate) >= '2005' THEN NULL
ELSE p.Name
END 
AS 'ProjectName'
FROM Employees AS e
JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID = 24

--Task9
SELECT e.EmployeeID, e.FirstName, e.ManagerID, m.FirstName AS 'ManagerName'
FROM Employees AS e
JOIN Employees AS m
ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IN (3, 7)
ORDER BY e.EmployeeID

--Task10
SELECT TOP(50) e.EmployeeID, 
CONCAT(e.FirstName, ' ', e.LastName) AS 'EmployeeName',
CONCAT(m.FirstName, ' ', m.LastName) AS 'ManagerName',
d.Name AS 'DepartmentName'
FROM Employees AS e
JOIN Employees AS m
ON e.ManagerID = m.EmployeeID
JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
ORDER BY e.EmployeeID

--Task11
SELECT MIN(AvgSalary) AS 'MinAverageSalary'
FROM 
(
SELECT AVG(Salary) AS 'AvgSalary'
FROM Employees
GROUP BY DepartmentID
) 
AS [AverageSalaries]