--Task1
SELECT COUNT(*) AS 'Count'
FROM WizzardDeposits

--Task2
SELECT MAX(w.MagicWandSize) AS 'LongestMagicWand'
FROM WizzardDeposits AS w

--Task3
SELECT w.DepositGroup,
MAX(w.MagicWandSize) AS 'LongestMagicWand'
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup

--Task4
SELECT TOP(2) w.DepositGroup
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup
ORDER BY AVG(w.MagicWandSize)

--Task5
SELECT w.DepositGroup,
SUM(w.DepositAmount) AS 'TotalSum'
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup

--Task6
SELECT w.DepositGroup,
SUM(w.DepositAmount) AS 'TotalSum'
FROM WizzardDeposits AS w
WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup

--Task7
SELECT w.DepositGroup,
SUM(w.DepositAmount) AS 'TotalSum'
FROM WizzardDeposits AS w
WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup
HAVING SUM(w.DepositAmount) < 150000
ORDER BY TotalSum DESC

--Task8
SELECT w.DepositGroup, w.MagicWandCreator,
MIN(w.DepositCharge) AS 'MinDepositCharge'
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup, w.MagicWandCreator
ORDER BY w.MagicWandCreator, w.DepositGroup

--Task9
SELECT AgeGroup,
COUNT(*) AS 'WizardCount'
FROM
(
SELECT
CASE
WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
ELSE '[61+]'
END
AS [AgeGroup]
FROM WizzardDeposits
)
AS [AgeGroupSubquery]
GROUP BY AgeGroup

--Task10
SELECT LEFT(FirstName, 1) AS 'FirstLetter'
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
GROUP BY SUBSTRING(FirstName, 1, 1)
ORDER BY FirstLetter

--Task11
SELECT DepositGroup, IsDepositExpired,
AVG(DepositInterest) AS 'AverageInterest'
FROM WizzardDeposits
WHERE DepositStartDate > '01/01/1985'
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired