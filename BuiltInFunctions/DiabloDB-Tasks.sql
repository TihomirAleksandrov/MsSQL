--Task14
SELECT TOP(50) g.Name, FORMAT(g.Start, 'yyyy-MM-dd') AS [StartDate]
FROM Games AS g
WHERE YEAR(g.Start) BETWEEN 2011 AND 2012
ORDER BY g.Start, g.Name

--Task15
SELECT [Username], SUBSTRING([Email], CHARINDEX('@', [Email], 1) + 1, LEN([Email]))
AS [EmailProvider]
FROM Users AS u
ORDER BY [EmailProvider], [Username]

--Task16
SELECT [Username], [IpAddress] AS [IP Address]
FROM [Users]
WHERE [IpAddress] LIKE '___.1_%._%.___'
ORDER BY [Username]

--Task17
SELECT [Name] AS [Game],
CASE
WHEN DATEPART(HOUR, [Start]) >= 0 AND DATEPART(HOUR, [Start]) < 12 THEN 'Morning'
When DATEPART(HOUR, [Start]) >= 12 AND DATEPART(HOUR, [Start]) < 18 THEN 'Afternoon'
ELSE 'Evening'
END
AS [Part of the Day],
CASE
WHEN [Duration] <= 3 THEN 'Extra Short'
WHEN [Duration] BETWEEN 4 AND 6 THEN 'Short'
WHEN [Duration] > 6 THEN 'Long'
ELSE 'Extra Long'
END
AS [Duration]
FROM [Games]
ORDER BY [Game], [Duration], [Part of the Day]