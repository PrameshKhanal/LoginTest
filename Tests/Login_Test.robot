*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://www.posti.fi/fi
${BROWSER}     firefox
${USERNAME}    pramesh
${PASSWORD}    1234

*** Test Cases ***
Open the browser
    open browser    ${URL}    ${BROWSER}
    wait until element is visible    //*[@id="onetrust-button-group-parent"]    timeout=10
    click button    //*[@id="onetrust-accept-btn-handler"]
Open the English page
    wait until element is visible    id:topbar-locale-dropdown    timeout=10
    click element    id:topbar-locale-dropdown
    wait until element is visible    id:EN    timeout=10
    click button    id:EN
Open the Sign in page
    wait until element is visible    //*[contains(text(), 'Log in')]    timeout=10
    click element    //*[contains(text(), 'Log in')]
    wait until element is visible    //a[p[text()='OmaPosti']]
    click element    //a[p[text()='OmaPosti']]
Verify the username and password
    page should contain button    id:posti_login_btn
    input text    id:username    ${USERNAME}
    input text    id:password    ${PASSWORD}
    click button    id:posti_login_btn
Close the browser
    sleep    2s
    close browser

*** Keywords ***
