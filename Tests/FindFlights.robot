*** Settings ***
Documentation    This is the "Find flights" test
Resource         ../keywords/ReserveFlight.robot
Resource         ../Resources/Common.resource
Library            ExcelLibrary

Test Setup       User has successfully logged into flights service app
Test Teardown    Default Teardown

*** Test Cases ***
Find and book available flight for customer
    [Tags]    FindFlight
        Given searches for relevant flight
        Then Available flights are displayed
#    When User selects flight
#    Then Enters name to order flight
#    Then Display flight order number

#Search customer flight with name and date
#    Given user has selected search order
#    And enter customer name
#    Then display available flight details



    