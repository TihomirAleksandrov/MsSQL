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

INSERT INTO[Passports]([PassportNumber])
VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

INSERT INTO[Persons]([FirstName], [Salary], [PassportID])
VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)

--Task 2

CREATE TABLE[Manufacturers]
(
[ManufacturerID] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(50) NOT NULL,
[EstablishedOn] DATETIME2 NOT NULL
)

CREATE TABLE[Models]
(
[ModelID] INT PRIMARY KEY IDENTITY(101, 1),
[Name] NVARCHAR(50) NOT NULL,
[ManufacturerID] INT FOREIGN KEY REFERENCES [Manufacturers]([ManufacturerID]) NOT NULL
)

INSERT INTO[Manufacturers]([Name], [EstablishedOn])
VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

INSERT INTO[Models]([Name], [ManufacturerID])
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)