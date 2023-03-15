--Task11
SELECT c.CountryName AS [Country Name] , c.IsoCode AS [ISO Code] 
FROM Countries AS c
WHERE c.CountryName LIKE '%a%a%a%'
ORDER BY c.IsoCode

--Task12
SELECT [PeakName], [RiverName], 
LOWER(CONCAT([PeakName], SUBSTRING([RiverName], 2, LEN([RiverName]))))
AS [Mix]
FROM [Peaks], [Rivers]
WHERE RIGHT(LOWER([PeakName]), 1) = LEFT(LOWER([RiverName]), 1)
ORDER BY [Mix]