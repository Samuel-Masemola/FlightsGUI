*** Settings ***
Documentation                                       This is the update flight keyword class
Library                                             RPA.Windows
Library                                             RPA.Desktop


*** Variables ***
${Tickets_combo}     id:numOfTicketsCombo
${update_btn}        id:updateBtn


*** Keywords ***
change amount of tickets
    Select     ${Tickets_combo}    2
    RPA.Windows.Click      ${update_btn}
    Take Screenshot               ${CURDIR}${/}..\\results\\UpdateTickets.png
