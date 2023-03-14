*** Settings ***
Documentation    Contains open and close browser keywords
Library          SeleniumLibrary

*** Keywords ***
Open the browser
    open browser    ${URL}    ${BROWSER}
    wait until element is visible    //*[@id="onetrust-button-group-parent"]    timeout=10
    click button    //*[@id="onetrust-accept-btn-handler"]
Close the browser
    [Tags]    close session
    sleep    2s
    close browser