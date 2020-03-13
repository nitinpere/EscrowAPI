*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Seller_API.robot
#Resource    ../../Resource/Keyword/All Keyword mobileAPI.robot
Resource    ../../Resource/Variable/User data.robot
*** Variables ***
${escrowCompId}=  001
${IdNumber}
${sellerid}
${mobileNo}
${enum}
*** Test Cases ***
Register Seller Valid data
    ${TokenEscrow}=    GetToken Escrow
#    log to console  ${TokenEscrow}
#    ${mobile}    ${ThaiId}    Register User Thai Post    ${TokenTH}    @{Data_for_register_User}    000
#    ${mobile}    ${passcode}    Set Passcode    ${TokenTH}      @{Data_for_register_User}[0]    111111    000
#    ${TokenLogin}=    Login Wallet@Post    ${TokenTH}    ${mobile}    ${passcode}    deviceId    deviceToken    000
#    Register New Virtual Card    ${TokenLogin}    ${ThaiId}    ${passcode}    True    000
RandomeGenerateVaribales with Values
    ${Id}=  Generate Random String  14   [NUMBERS]
    SET GLOBAL VARIABLE  ${IdNumber}  ${Id}
    ${mobile}=   Generate Random String  10   [NUMBERS]
    SET GLOBAL VARIABLE  ${mobileNo}  ${mobile}
    ${Emailnum}=  Generate Random String  3  [NUMBERS]
    SET GLOBAL VARIABLE  ${enum}  ${Emailnum}

RegisterNewSeller valid data
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}  ${escrowCompId}  ${IdNumber}  ${1}  ${0}  000

RegisterNewSeller Empty Mandatory Field
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}  ${}  ${}  ${}  ${}  000