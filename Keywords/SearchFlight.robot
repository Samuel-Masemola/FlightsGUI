*** Settings ***
Documentation                                       FindFlight keyword class
Library                                             RPA.Windows
Library                                             RPA.Desktop
Library                                             DataDriver    ..\\resources\\SampleAppData.xlsx    sheet_name=nput
Library                                             ExcelLibrary



*** Variables ***
#${old_wait_time}=  Set Wait Time  5.0
#Login screen elements
${path}                                            C:\\Users\\a232985\\Downloads\\Flights Application 3\\Flights Application\\FlightsGUI.exe
${txt_username}                                    id:agentName
${txt_password}                                    id:password
${btn_signin}                                      id:okButton
${screen_login}                                    class:NavigationWindow



#Book flight elements
${combo_frmCTY}                                    id:fromCity
${combo_toCTY}                                     id:toCity
${txt_date}                                        id:PART_TextBox
${combo_class}                                     id:Class
${combo_numOfTickets}                              id:numOfTickets
${btn_find}                                        class:Button
${btn_find2}                                       name:"FIND FLIGHTS"



*** Keywords ***
User has successfully logged into flights service app
    ${old_wait_time}=  Set Wait Time  2.5
    Windows Run    ${path}
    Control window    Micro Focus MyFlight Sample Application
    ${username}    Read Excel    ${CURDIR}${/}..\\Resources\\SampleAppData.xlsx    nput    2    10
    Log To Console    ${username}
    Send Keys         ${txt_username}    ${username}
    ${password}    Read Excel    ${CURDIR}${/}..\\Resources\\SampleAppData.xlsx    nput    2    11
    Log To Console    ${password}
    Send Keys         ${txt_password}    ${password}
    Take Screenshot    ${CURDIR}${/}..\\results\\LoginSuccess.png
    RPA.Windows.Click    ${btn_signin}


Read Excel
    [Arguments]    ${filepath}    ${sheetname}    ${rownum}    ${colnum}
    Open Excel Document     ${filepath}        1                #Number 1 refers to the doc_id:str argument on method
    Get Sheet               ${sheetname}
    ${data}=                Read Excel Cell    ${rownum}    ${colnum}
    [Return]                ${data}
    Close Current Excel Document

searches for relevant flight
    #Sleep    5
    #Wait For Element    ${combo_frmCTY}    5
    Control window    Micro Focus MyFlight Sample Application
    Select     ${combo_frmCTY}     Paris
    Select     ${combo_toCTY}      Seattle
    Select     ${combo_class}      Economy
    Select     ${combo_numOfTickets}    3
    Send Keys  ${txt_date}         2115/06/01
    Log To Console    ${combo_frmCTY}
    Take Screenshot    ${CURDIR}${/}..\\results\\SearchFlight.png
    RPA.Windows.Click      ${btn_find2}

Available flights are displayed
    Take Screenshot    ${CURDIR}${/}..\\results\\SearchFlight.png


Default Teardown
    log to console  ---------------------------Default Teardown---------------------------------------------
    Close Current Window
#    Run Keyword If Test Failed    Capture page screenshot
#    run keyword if test failed      return error message