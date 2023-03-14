*** Settings ***
Documentation    Keyword that combines opening the browser and navigation
Library          SeleniumLibrary
Resource         ../Resources/common.robot
Resource         ../Resources/topnav.robot

*** Keywords ***
Navigate to the Login page
    common.Open the browser
    topnav.Open the English page
    topnav.Open the Sign in page