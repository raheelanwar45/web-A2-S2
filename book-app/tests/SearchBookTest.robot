*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${BASE_URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}       http://localhost:3000  # Update with the actual URL of your application
${BROWSER}        brave

*** Test Cases ***
Search Books Test
    [Documentation]    Test the search functionality on the SearchBook page
    Open SearchBook Page
    Input Search Query    Robot Framework
    Click Search Button
    Verify Books Displayed

*** Keywords ***
Open SearchBook Page
    Open Browser    ${BASE_URL}

Input Search Query
    [Arguments]    ${query}
    Input Text    css=input.search-bar    ${query}

Click Search Button
    Click Element    css=input.search-bar

Verify Books Displayed
    Wait Until Element Is Visible    css=.book-container    timeout=10s
    Element Should Be Visible    css=.book-container
    Log    Books were successfully searched.
