*** Settings ***
Documentation    To validate the Login Form
Library        SeleniumLibrary
*** Variables ***
${validuser_name}    rahulshettyacademy
${validPassword}    learning
${invalid_password}    1234
${browsername}    Chrome
*** Keywords ***
 open the browser with the Mortgage payment url
     Create Webdriver    ${browsername}
     Go To    https://rahulshettyacademy.com/loginpagePractise/
Close browser session
     Close Browser