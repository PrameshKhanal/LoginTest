*** Settings ***
Documentation    Contains Keywords for the navigation pages
Library          SeleniumLibrary

*** Keywords ***
Open the English page
    [Tags]    english
    wait until element is visible    id:topbar-locale-dropdown    timeout=10
    click element    id:topbar-locale-dropdown
    wait until element is visible    id:EN    timeout=10
    click button    id:EN
Open the Sign in page
    [Tags]    signin page
    wait until element is visible    //*[contains(text(), 'Log in')]    timeout=10
    click element    //*[contains(text(), 'Log in')]
    wait until element is visible    //a[p[text()='OmaPosti']]
    click element    //a[p[text()='OmaPosti']]