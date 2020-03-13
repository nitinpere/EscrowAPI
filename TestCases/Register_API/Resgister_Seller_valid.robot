*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
#Resource    ../../Resource/Keyword/All Keyword mobileAPI.robot
#Resource    ../../Resource/Variable/User data.robot
*** Test Cases ***
Register Seller Valid data
    ${TokenEscrow}=    GetToken Escrow
#    log to console  ${TokenEscrow}
#    ${mobile}    ${ThaiId}    Register User Thai Post    ${TokenTH}    @{Data_for_register_User}    000
#    ${mobile}    ${passcode}    Set Passcode    ${TokenTH}      @{Data_for_register_User}[0]    111111    000
#    ${TokenLogin}=    Login Wallet@Post    ${TokenTH}    ${mobile}    ${passcode}    deviceId    deviceToken    000
#    Register New Virtual Card    ${TokenLogin}    ${ThaiId}    ${passcode}    True    000