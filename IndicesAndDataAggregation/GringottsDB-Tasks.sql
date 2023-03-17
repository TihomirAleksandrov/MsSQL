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