*** Settings ***
Documentation    This is a negative test
Resource         ../Resources/Common.resource

*** Test Cases ***
Find a flight for customer
    [Tags]    Negative
    Given User input wrong credentials
    #Then Login button should be disabled
