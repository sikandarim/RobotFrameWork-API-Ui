*** Settings ***
Documentation    To validate the Login Form
Library    SeleniumLibrary
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource   ../PO/ShopingPage.robot
Test Setup    open the browser with the Mortgage payment url

#Rresource

*** Test Cases ***    username    password

Validate Succesful Login
    [Tags]    SMOKE        REGRESSION
    LandingPage.Validate the userid is in the page
    LandingPage.Fill the login Form        ${validuser_name}            ${validPassword}
    LandingPage.Click the submit Button
    ShopingPage.Wait Until Element Is located in the page
    ShopingPage.Verify Card Titles In Shop Page
    ShopingPage.Select the Card     Blackberry

Validate UnSuccesful Login
    LandingPage.Validate the userid is in the page
    LandingPage.Fill the login Form        ${validuser_name}            ${invalid_password}
    LandingPage.Click the submit Button
    LandingPage.wait until it checks and display error message
    LandingPage.verify error message is correct


LandingPage.Validate the userid is in the page
    LandingPage.Fill the login Form        ${validuser_name}            ${validPassword}
    LandingPage.Fill the Login Details and Login Form
    LandingPage.Click the submit Button