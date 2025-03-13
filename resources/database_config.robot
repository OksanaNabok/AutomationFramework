*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${DB_NAME}         AdventureWorks2012           # Database name
${DB_HOST}         127.0.0.1                    # Host (can be 127.0.0.1 or localhost)
${DB_USER}         RobotTestUser1               # SQL username
${DB_PASSWORD}     testPass                     # SQL password
${DB_PORT}         1433                         # Default SQL Server port
${DB_DRIVER}       ODBC Driver 17 for SQL Server  # Ensure this driver is installed

*** Keywords ***
My Custom Connect To Database
    [Documentation]  This keyword sets up the database connection.
    Connect To Database    pyodbc    DRIVER=${DB_DRIVER};SERVER=${DB_HOST},${DB_PORT};DATABASE=${DB_NAME};UID=${DB_USER};PWD=${DB_PASSWORD};