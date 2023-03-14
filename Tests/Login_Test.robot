*** Settings ***
Documentation    The test to verify the user Login page. This test will check if the incorrect login info
...              messages will be displayed when the user enters the wrong username and/or password
Library          SeleniumLibrary
Resource         ../Resources/loginnav.robot
Resource         ../Resources/common.robot
Test Setup       Navigate to the Login page
Test Teardown    Close the browser
Test Template    Verify the username and password

*** Variables ***
${URL}         https://www.posti.fi
${BROWSER}     firefox

*** Test Cases ***
Invalid Login using wrong username and password                      pramesh     1234
Invalid Login using empty username and wrong passowrd                ${EMPTY}    1234
Invalid Login using wrong username and empty password                pramesh     ${EMPTY}
Invalid Login using empty username and empty password                ${EMPTY}    ${EMPTY}
Invalid Login using numbered username and wrong password             1234        pramesh
Invalid Login using special character username and wrong password    @#$%^&      1234
Invalid Login using empty username and special character password    ${EMPTY}    @#$%^&

*** Keywords ***
Verify the username and password
    [Tags]    login
    [Arguments]    ${USERNAME}    ${PASSWORD}
    page should contain button    id:posti_login_btn
    input text    id:username    ${USERNAME}
    input text    id:password    ${PASSWORD}
    click button    id:posti_login_btn
    page should contain  Your login information was invalid. Please re-enter your login information. Please note that you should login with your email address.
    capture page screenshot    selenium-screenshot-{index}.png