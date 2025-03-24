*** Settings ***
Documentation   All the page Objects and keywods of landing page
Library        SeleniumLibrary

*** Variables ***
${Shop_page_load}           css:.nav-link
*** Keywords ***

Wait Until Element Is located in the page
    Wait Until Element Is Visible    ${Shop_page_load}
Verify Card Titles In Shop Page
    ${elements}=    Get WebElements    css:.card-title
    ${actual_list}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${actual_list}=    Evaluate    ${actual_list} + ["${text}"]    modules=collections
    END
    @{expected_list}=    Create List    iphone X   Samsung Note 8   Nokia Edge    Blackberry
    FOR    ${item}    IN    ${expected_list}
    Should Be Equal        ${actual_list}    ${item}
    END
Select The Card
    [arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    0
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Exit For Loop If    '${cardName}' == '${text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button   xpath=(//div[@class="card-footer"]/button)[${index}]