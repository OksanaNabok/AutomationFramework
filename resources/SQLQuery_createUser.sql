USE master;
CREATE LOGIN RobotTestUser1 WITH PASSWORD = 'testPass';
GO


USE AdventureWorks2012;
CREATE USER RobotTestUser1 FOR LOGIN RobotTestUser1;
GO

EXEC sp_addrolemember N'db_datareader', N'RobotTestUser1';
