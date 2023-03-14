CREATE DATABASE[TableRelations]

GO

USE[TableRelations]

GO

--Problem 1

CREATE TABLE[Passports]
(
[PassportID] INT PRIMARY KEY IDENTITY(101, 1),
[PassportNumber] NVARCHAR(8) NOT NULL
)

CREATE TABLE[Persons]
(
[PersonID] INT PRIMARY KEY IDENTITY,
[FirstName] NVARCHAR(40),
[Salary] DECIMAL(8, 2),
[PassportID] INT FOREIGN KEY REFERENCES [Passports]([PassportID]) UNIQUE NOT NULL
)
