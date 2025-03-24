*** Settings ***
Documentation    To validate the Login Form
Library          SeleniumLibrary
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Test Setup       open the browser with the Mortgage payment url
Test Template    Validate UnSuccesful Login
#Rresource
*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***    username    password
Invalid username      dbdrgr    1234
Invalid char          85y9      learn
Another one           wrong     guess

*** Keywords ***
Validate UnSuccesful Login
    LandingPage.Validate the userid is in the page
    [Arguments]       ${user_name}        ${password}
    Input Text        id:username         ${user_name}
    Input Password    id:password         ${password}
    LandingPage.Click the submit Button
    LandingPage.wait until it checks and display error message
    LandingPage.verify error message is correct

