*** Settings ***
Resource    ../resources/database_config.robot

*** Test Cases ***

# Test Case 1: Verify Minimum ModifiedDate in UnitMeasure Table
Verify Minimum ModifiedDate In UnitMeasure Table
    [Documentation]  Verify that the minimum date in ModifiedDate is valid (not NULL and within a reasonable range).
    My Custom Connect To Database
    ${query_result} =  Query   SELECT MIN([ModifiedDate]) FROM [Production].[UnitMeasure];
    Log  ${query_result}
    # You may replace the expected minimum date with an actual known value
    Should Be True    '${query_result}[0][0]' >= '2000-01-01'
    Disconnect From Database

# Test Case 2: Verify Unique Names in the UnitMeasure Table
Verify Unique Names Count In UnitMeasure Table
    [Documentation]  Verify the count of unique UnitMeasure names in the table.
    My Custom Connect To Database
    ${query_result} =  Query   SELECT COUNT(DISTINCT [Name]) FROM [Production].[UnitMeasure];
    Log  ${query_result}
    Should Be Equal As Numbers  ${query_result}[0][0]   38  # Replace 38 with your expected unique count
    Disconnect From Database