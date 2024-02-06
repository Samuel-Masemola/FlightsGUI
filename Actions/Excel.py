import openpyxl
from SeleniumLibrary.base import keyword

class Excel(object):
    @keyword
    def get_data(self, CustomerName, FlightNumber, numberOfTickets, Class, DepartureCity, ArrivalCity, Price):
        excelfilepath = "DataManager.xlsx"
