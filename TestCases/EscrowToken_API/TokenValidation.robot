*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Seller_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Variables ***
${IdNumber}

*** Test Cases ***
Random Generated VariableValues
    ${Id4}=  Generate Random String  14   [NUMBERS]
    SET GLOBAL VARIABLE  ${IdNumber}  ${Id4}

TC_01 RegisterNewSeller with Empty JWT Token
    ${sellerid_locaL}=  RegisterSeller  ${None}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01

TC_02 RegisterNewSeller with Invalid JWT Token
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller  ${TokenEscrow}1a2b3  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01

TC_03 RegisterNewSeller with Expired JWT Token
    ${TokenEscrow}=  GetToken Escrow
    Sleep  7 minutes
    ${sellerid_locaL}=  RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A02

TC_04 RegisterNewSeller with Other Company JWT Token
    ${TokenEscrow}=  GetToken BIGC
    ${sellerid_locaL}=  RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01

TC_05 RegisterNewSeller with Valid JWT Token
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  000