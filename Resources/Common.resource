*** Settings ***
Documentation                                       Common keywords file
Library                                             RPA.Windows
Library                                             RPA.Desktop
Library                                             Selenium
Library                                             ExcelLibrary

*** Variables ***
#Login screen elements
${path}                                            C:\\Users\\a232985\\Downloads\\Flights Application 3\\Flights Application\\FlightsGUI.exe
${txt_username}                                    id:agentName
${txt_password}                                    automationid:password
${btn_signin}                                      id:okButton
${screen_login}                                    class:NavigationWindow
${popup_error_msg}                                 id:65535
${popup_ok_btn}                                    id:2


*** Keywords ***
#Needs more work. Failing to find element
Login button should be disabled
    ${btn_signin}=   Get Attribute  type:button name:IsEnabled   AutomationId
    IF    ${is_element_enabled} == True
        Click    ${btn_sigin}
    ELSE
        Screenshot    ${btn_signin}    results\login.png

User has successfully logged into flights service app
    log to console  ---------------------------Default Setup---------------------------------------------
    ${old_wait_time}=  Set Wait Time  2.5
    Windows Run    ${path}
    Control window    Micro Focus MyFlight Sample Application
    ${username}    Read Excel    ${CURDIR}${/}..\\Resources\\SampleAppData.xlsx    nput    2    10
    Send Keys         ${txt_username}    ${username}
    ${password}    Read Excel    ${CURDIR}${/}..\\Resources\\SampleAppData.xlsx    nput    2    11
    Log To Console    ${username}    ${password}
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

User input wrong credentials
    log to console  ---------------------------Invalid credentials---------------------------------------------
    ${old_wait_time}=  Set Wait Time  2.5
    Windows Run    ${path}
    Control window    Micro Focus MyFlight Sample Application
    ${username}    Read Excel    ${CURDIR}${/}..\\Resources\\SampleAppData.xlsx    nput    4    10
    Log To Console    ${username}
    Send Keys         ${txt_username}    ${username}
    ${password}    Read Excel    ${CURDIR}${/}..\\Resources\\SampleAppData.xlsx    nput    4    11
    Log To Console    ${password}
    Send Keys         ${txt_password}    ${password}
    #Take Screenshot    ${CURDIR}${/}..\\results\\LoginFailed.png
    RPA.Windows.Click    ${btn_signin}
    #${error_msg}= desktop.read_text(${popup_error_msg})
    ${date} =  Get Text    ${popup_error_msg}
    Log To Console    ${date}
    Take Screenshot    ${CURDIR}${/}..\\results\\LoginFailed.png
    RPA.Windows.Click    ${popup_ok_btn}


Default Teardown
    log to console  ---------------------------Default Teardown---------------------------------------------
    Close Current Window
#    Run Keyword If Test Failed    Capture page screenshot
#    run keyword if test failed      return error message
