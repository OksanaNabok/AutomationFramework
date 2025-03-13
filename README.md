# AdventureWorks Robot Framework Tests

## Overview
This project contains automated test cases for verifying data integrity in the AdventureWorksDW2012 database using Robot Framework and SQL queries.
Test cases locates in folder `tests`

## Prerequisites
- MSSQL Server with AdventureWorks2012 database installed (backup file is located in: `resources/AdventureWorks2012.bak`).
- Python with the following libraries:
  - Robot Framework
  - DatabaseLibrary
  - PyODBC

## Setup
1. Configure the `resources/database_config.robot` file with your database connection details.
2. Create the MSSQL login using the script in above or running file `resources/SQLQuery_createUser.sql`:
"
USE master;
Create LOGIN NewTestUser WITH PASSWORD = 'yourStrongPassword1!';
GO

USE AdventureWorks2012;
CREATE USER RFTestUser FOR LOGIN NEWTestUser;
GO

EXEC sp_addrolemember N'db_datareader', N'RFTestUser';
"

## Running Tests
Run the tests with:
robot -d reports tests

## Viewing Reports
Test reports and logs will be generated in the `reports/` directory. Open `report.html` to view the summary.