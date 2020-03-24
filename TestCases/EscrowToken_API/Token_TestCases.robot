*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Register_Seller_API.robot
Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***

TC_01 RegisterNewSeller with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token.
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${None}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01  Invalid access token

TC_02 RegisterNewSeller with Invalid JWT Token
    [Documentation]  Invalid : To verify response for Invalid JWT token.
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${TokenEscrow}1a2b3  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01  Invalid access token

TC_04 RegisterNewSeller with Other Company JWT Token
    [Documentation]  Invalid: To check API response with other company JWT token.
    ${TokenEscrow}=  GetToken BIGC
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01  Invalid access token

TC_05 RegisterNewSeller with Valid JWT Token
    [Documentation]  Valid: To check API response with valid JWT token.
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  000  Success

TC_03 RegisterNewSeller with Expired JWT Token
    [Documentation]  Invalid : To verify response for Expired JWT token.
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    Sleep  7 minutes
    RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A02  Access token expired



