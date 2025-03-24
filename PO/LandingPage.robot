*** Settings ***
Documentation   All the page Objects and keywods of landing page
Library        SeleniumLibrary
Resource    ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger
*** Keywords ***
#Scripting for Login Page
Validate the userid is in the page
   Wait Until Element Is Visible    id:username
Fill the login Form
    [Arguments]       ${user_name}        ${password}
    Input Text        id:username         ${user_name}
    Input Password    id:password         ${password}
Click the submit Button
   Click Button      id:signInBtn
wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}
verify error message is correct
     ${result}=     Get Text    ${Error_Message_Login}
     Should Be Equal As Strings    ${result}     Incorrect username/password.
     Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Fill the Login Details and Login Form
    Click Element     css:input[value='user']
    Wait Until Element Is Visible      id:okayBtn
    Click Element    id:okayBtn
    Click Element    id:okayBtn
    Wait Until Element Is Not Visible   id:okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms

