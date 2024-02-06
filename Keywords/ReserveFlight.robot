*** Settings ***
Documentation                                       Reserve flight keyword class
Library                                             RPA.Windows
Library                                             RPA.Desktop
Library                                             DataDriver    ..\\resources\\SampleAppData.xlsx    sheet_name=nput
Library                                             ExcelLibrary



*** Variables ***
#Book flights tab elements
${combo_frmCTY}                                    id:fromCity
${combo_toCTY}                                     id:toCity
${txt_date}                                        id:PART_TextBox
${combo_class}                                     id:Class
${combo_numOfTickets}                              id:numOfTickets
${btn_find}                                        class:Button
${btn_find2}                                       name:"FIND FLIGHTS"



*** Keywords ***
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