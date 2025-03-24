*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
##Adding the Library
Library     ../customLibraries/Shop.py
Test Setup      open the browser with the url
Suite Setup
Suite Teardown
Test Teardown   Close Browser session

