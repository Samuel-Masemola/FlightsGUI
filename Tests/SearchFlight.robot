*** Settings ***
Documentation    This is the "Find flights" test
Resource         ../Resources/Common.resource
Resource         ../Keywords/GetFlight.robot

Test Setup       User has successfully logged into flights service app
Test Teardown    Default Teardown


*** Test Cases ***
Search reserved flight using customer name
    [Tags]    Reserved
    Given User search using name
    Then select reserved flight
    Then search for another flight

