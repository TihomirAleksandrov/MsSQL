--Task12
SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM Countries AS c
JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
JOIN Mountains AS m
ON mc.MountainId = m.Id
JOIN Peaks AS p
ON m.Id = p.MountainId
WHERE c.CountryCode = 'BG'
AND p.Elevation > 2835
ORDER BY p.Elevation DESC 

--Task13
SELECT CountryCode, COUNT(MountainId)  AS 'MountainRanges'
FROM MountainsCountries
WHERE CountryCode IN 
(
SELECT CountryCode
FROM Countries
WHERE CountryName IN ('United States', 'Russia', 'Bulgaria')
)
GROUP BY CountryCode

--Task14
SELECT TOP(5) c.CountryName, r.RiverName
FROM Countries AS c
 LEFT JOIN CountriesRivers AS cr
 ON c.CountryCode = cr.CountryCode
 LEFT JOIN Rivers AS r
 ON cr.RiverId = r.Id
 WHERE c.ContinentCode IN
 (
 SELECT ContinentCode FROM Continents
 WHERE ContinentName = 'Africa'
 )
 ORDER BY c.CountryName

 --Task16
SELECT COUNT(*) AS 'Count'
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
WHERE mc.MountainId IS NULL

--Task17
SELECT TOP(5) c.CountryName,
MAX(p.Elevation) AS 'HighestPeakElevation',
MAX(r.Length) as 'LongestRiverLength'
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains AS m
ON mc.MountainId = m.Id
LEFT JOIN Peaks AS p
ON m.Id = p.MountainId
LEFT JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers AS r
ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName

--Task18
SELECT  
CountryName AS 'Country',
CASE
WHEN PeakName IS NULL THEN '(no highest peak)'
ELSE PeakName
END
AS 'Highest Peak Name',
CASE
WHEN Elevation IS NULL THEN 0
ELSE Elevation
END
AS 'Highest Peak Elevation',
CASE
WHEN MountainRange IS NULL THEN '(no mountain)'
ELSE MountainRange
END
AS 'Mountain'
FROM
(
SELECT c.CountryName, p.PeakName, p.Elevation, m.MountainRange,
DENSE_RANK() OVER(PARTITION BY [c].[CountryName] ORDER BY [p].[Elevation] DESC) AS [PeakRank]
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains AS m
ON mc.MountainId = m.Id
LEFT JOIN Peaks AS p
ON m.Id = p.MountainId
)
AS [PeakRankingSubquery]
WHERE PeakRank = 1
ORDER BY [Country], [Highest Peak Name]
