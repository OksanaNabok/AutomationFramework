# AdventureWorks Robot Framework Tests

## Task
1. Create 2 DIFFERENT test cases for data checks on "AdventureWorks2012" database (3 different tables) and document them (name, steps, expected results).
Example TC#1 count for column; TC#2 average function for column, TC#3 max\min values, TC#4 values in range of list ...... etc.
Tables to use:
-[Person].[Address]
-[Production].[Document]
-[Production].[UnitMeasure]
As a result you should have 6 different test cases for 3 different tables (2 per table).
2. Create user in MSSQL to connect from RF
3. Create a project for running RF tests.
4. Automate test cases from step 1 so that they can connect to MS SQL DB from SQL Module on your localhost.
5. Store a test report.


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
2. - Create the MSSQL login using the script in `resources/SQLQuery_createUser.sql` Or 
- creating new user in SSMS:
go to Object Explorer -> Security -> Logins -> right button -> new login... -> create new Login with next credentials: 
- Login name: RobotTestUser1
- choose "sql server authentication"
- default database -> AdventureWorks2012
- -> press ok
next go to AdventureWorks2012 db -> security -> Users -> right button -> new user... -> create new User with next credentials: 
general 
- User name: RobotTestUser1
- Login name: RobotTestUser1
- default schema: dbo
membership:
- database role membership: db_datareader
- -> press ok
3. To check connection - run the file `resources/testConnection.py`

## Running Tests
Run the tests with:
robot -d reports tests

## Viewing Reports
Test reports and logs will be generated in the `reports/` directory. Open `report.html` to view the summary.