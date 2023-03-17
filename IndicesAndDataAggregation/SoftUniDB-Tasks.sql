--Task13
SELECT d.DepartmentID,
SUM(e.Salary) AS 'TotalSalary'
FROM Departments AS d
JOIN Employees AS e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID

--Task14
SELECT d.DepartmentID,
MIN(e.Salary) AS 'MinimumSalary'
FROM Departments AS d
JOIN Employees AS e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IN (2, 5, 7)
GROUP BY d.DepartmentID

--Task15
SELECT *
INTO [EmployeesEarnMoreThan30000]
FROM Employees
WHERE Salary > 30000

DELETE
FROM EmployeesEarnMoreThan30000
WHERE ManagerID = 42

UPDATE EmployeesEarnMoreThan30000
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID,
AVG(Salary) AS 'AverageSalary'
FROM EmployeesEarnMoreThan30000
GROUP BY DepartmentID

--Task16
SELECT DepartmentID, 
MAX(Salary) AS 'MaxSalary'
FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000

--Task17
SELECT COUNT(Salary) AS 'Count'
FROM Employees
WHERE ManagerID IS NULL