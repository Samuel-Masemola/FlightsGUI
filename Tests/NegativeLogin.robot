*** Settings ***
Documentation    This is the "Find flights" test
Resource         ../keywords/NegativeLogin.robot

*** Test Cases ***
Find a flight for customer
    [Tags]    Negative
    Given User input wrong credentials
    Then Login button should be disabled