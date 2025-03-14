*** Settings ***
Resource    ../resources/database_config.robot

*** Test Cases ***
Test Database Connection with Logging
    [Documentation]    Test the database connection with detailed logging.
    My Custom Connect To Database
    Log To Console    Successfully connected to AdventureWorks2012 database.
    ${query_result}=    Query   SELECT 1 AS TestResult;
    Log To Console    ${query_result}
    Should Be Equal As Numbers    ${query_result}[0][0]    1  # Should return 1 if connection is successful.
    Disconnect From Database

Verify Record Count in Address Table
    [Documentation]    Verify total record count in the Address table.
    My Custom Connect To Database
    ${query_result} =  Query   SELECT COUNT(*) FROM [Person].[Address];
    Log  ${query_result}
    Should Be Equal As Numbers   ${query_result}[0][0]   19614  # Replace 500 with your expected value
    Disconnect From Database

Verify Record Count of Postal Codes in Address Table
    [Documentation]  Verify the count of distinct Postal Codes in the Address table.
    My Custom Connect To Database
    ${query_result}=  Query  SELECT COUNT(DISTINCT [PostalCode]) FROM [Person].[Address];
    Log  ${query_result}
    Should Be Equal As Numbers   ${query_result}[0][0]   661   # Current value is 661. Replace 661 with your expected value
    Disconnect From Database
