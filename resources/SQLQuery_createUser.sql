USE master;
Create LOGIN NewTestUser WITH PASSWORD = 'yourStrongPassword1!';
GO


USE AdventureWorksDW2012;
CREATE USER RFTestUser FOR LOGIN NEWTestUser;
GO

EXEC sp_addrolemember N'db_datareader', N'RFTestUser';