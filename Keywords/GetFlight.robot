*** Settings ***
Documentation                                       This is the search for a reserved flight keyword class
Library                                             RPA.Windows
Library                                             RPA.Desktop

*** Variables ***
#Search flights tab elements
${Search_tab}        name:"SEARCH ORDER"
${Name_rbn}          id:byNameOrDateRadio
${Name_txt}          id:byNameWatermark
${Number_rbn}        id:byNumberRadio
${Number_txt}        id:byNumberWatermark
${Search_btn}        id:searchBtn
${ticket}            name:Samuel
${Select_ord_btn}    id:selectOrderBtn
${New_srch_btn}      id:newSearchBtn




*** Keywords ***
User search using name
    Control window    Micro Focus MyFlight Sample Application
    RPA.Windows.Click     ${Search_tab}
    RPA.Windows.Click     ${Name_rbn}
    Send Keys             ${Name_txt}    Samuel
    Take Screenshot    ${CURDIR}${/}..\\results\\SearchOrderName.png
    RPA.Windows.Click     ${Search_btn}


    
select reserved flight
    Take Screenshot               ${CURDIR}${/}..\\results\\SelectOrder.png
    RPA.Windows.Click             ${ticket}
    RPA.Windows.Click             ${Select_ord_btn}

    
search for another flight
    Take Screenshot               ${CURDIR}${/}..\\results\\SelectOrder.png
    RPA.Windows.Click              ${New_srch_btn}
    



    

Search using date

Search using order number
