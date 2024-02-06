*** Settings ***
Documentation    This is the "Find flights" test
Resource         ../Resources/Common.resource
Resource         ../Keywords/GetFlight.robot
Resource         ../Keywords/UpdateFlights.robot

Test Setup       User has successfully logged into flights service app
Test Teardown    Default Teardown


*** Test Cases ***
Change number of reserved flight tickets
    [Tags]    Update
    Given User search using name
    And select reserved flight
    Then change amount of tickets
