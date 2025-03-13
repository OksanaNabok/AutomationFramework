*** Settings ***
Library  Screenshot
*** Variables ***
${Name}    John
*** Test Cases ***
Screenshot and Log Test Case
    Take Screenshot and Log Text  ${Name}
*** Keywords ***
Take Screenshot and Log Text
    [Arguments]    ${Name}
    Take Screenshot
    Log    The screenshot has taken by ${Name}