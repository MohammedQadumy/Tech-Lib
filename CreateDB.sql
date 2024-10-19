USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'Tech-Lib'
)
CREATE DATABASE [Tech-Lib]
GO