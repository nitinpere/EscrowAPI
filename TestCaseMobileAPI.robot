*** Settings ***
Library    SeleniumLibrary
Resource    Resource/Keyword/Global Keyword/Get Token.robot
Resource    Resource/Keyword/All Keyword mobileAPI.robot
*** Test Cases ***
Register New Virtual Card
    ${TokenTH}=    GetToken Thai Post Mobile
    Log    ${TokenTH}
    LogIn    ${TokenTH}    0870844480    111111    Test    Test    001
    