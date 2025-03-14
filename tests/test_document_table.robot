*** Settings ***
Resource    ../resources/database_config.robot

*** Test Cases ***

# Test Case 1: Verify FileExtension Column is Never Empty
Verify FileExtension Column Is Not Empty
    [Documentation]  Verify that the FileExtension column in the Document table is not empty (NULL).
    My Custom Connect To Database
    ${query_result} =  Query   SELECT COUNT(*) FROM [Production].[Document] WHERE [FileExtension] IS NULL;
    Log  ${query_result}
    Should Be Equal As Numbers  ${query_result}[0][0]   0
    Disconnect From Database

# Test Case 2: Validate Total Records in the Document Table
Verify Document Table Has More Than 10 Records
    [Documentation]  Verify that the total number of documents is greater than 10 in the Document table.
    My Custom Connect To Database
    ${query_result} =  Query   SELECT COUNT(*) FROM [Production].[Document];
    Log  ${query_result}
    Should Be True    ${query_result}[0][0] > 10
    Disconnect From Database