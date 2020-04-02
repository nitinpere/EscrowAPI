*** Settings ***
Library    String
Library    SeleniumLibrary
#Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
#Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
#Resource    ../../Resource/Keyword/Register_Seller_API.robot
#Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
#Resource    ../../Resource/Keyword/UpdateSellerDetails_API.robot
#Resource    ../../Resource/Keyword/GetSellerDetails_API.robot
#Resource    ../../Resource/Variable/user data.robot

Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/All Keywords EscrowAPI.robot
Resource    ../../Resource/Variable/user data.robot
Test Setup   Sleep  2s



*** Test Cases ***

#  Register Seller Token Test Cases

TC_01 RegisterNewSeller with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token.
    [Tags]  A01
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${EMPTY}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01  Invalid access token

TC_02 RegisterNewSeller with Invalid JWT Token
    [Documentation]  Invalid : To verify response for Invalid JWT token.
    [Tags]  A01
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${TokenEscrow}1a2b3  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01  Invalid access token

TC_03 RegisterNewSeller with Expired JWT Token
    [Documentation]  Invalid : To verify response for Expired JWT token.
    [Tags]  A02
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    Sleep  7 minutes
    RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A02  Access token expired

TC_04 RegisterNewSeller with Other Company JWT Token
    [Documentation]  Invalid: To check API response with other company JWT token.
    [Tags]  A01
    ${TokenEscrow}=  GetToken BIGC
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  A01  Invalid access token

TC_05 RegisterNewSeller with Valid JWT Token
    [Documentation]  Valid: To check API response with valid JWT token.
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller  ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  000  Success


#  Update Seller Status Token Test Cases

TC_01 UpdateSellerStatus with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  A01
    ${SellerId}=  RegisterSellerID
    UpdateSeller  ${EMPTY}  @{escrowCompId}  ${SellerId}  ${4}  A01  Invalid access token

TC_02 UpdateSellerStatus with Invalid JWT Token
    [Documentation]  Invalid : To verify response for Invalid JWT token
    [Tags]  A01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}2c2p  @{escrowCompId}  ${SellerId}  ${4}  A01  Invalid access token

TC_03 UpdateSellerStatus with Expired JWT Token
    [Documentation]  Invalid : To verify response for Expired JWT token
    [Tags]  A02
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    Sleep  7 minutes
    UpdateSeller   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${1}  A02  Access token expired

TC_04 UpdateSellerStatus with Other Company JWT Token
    [Documentation]  Invalid: To check API response with other company JWT token.
    [Tags]  A01
    ${TokenEscrow}=  GetToken BIGC
    ${SellerId}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${4}  A01  Invalid access token

TC_05 UpdateSellerStatus with Valid JWT Token
    [Documentation]  Valid: To check API response with valid JWT token.
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSeller   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${1}  000  Success


# Update Seller Details Token Test Cases

TC_01 UpdateSellerDetails with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  A01
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails   ${EMPTY}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token

TC_02 UpdateSellerDetails with Invalid JWT Token
    [Documentation]  Invalid : To verify response for Invalid JWT token
    [Tags]  A01
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails   ${TokenEscrow}2c2p  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token

TC_03 UpdateSellerDetails with Expired JWT Token
    [Documentation]  Invalid : To verify response for Expired JWT token
    [Tags]  A02
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    Sleep  7 minutes
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A02  Access token expired

TC_04 UpdateSellerDetails with other company JWT token.
    [Documentation]  Invalid: To check API response with other company JWT token.
    [Tags]  A01
    ${TokenEscrow}=  GetToken BIGC
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token

TC_05 UpdateSellerDetails with valid JWT Token
    [Documentation]  Valid: To check API response with valid JWT token.
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  000  Success

# Get Seller Details Token Test Cases

TC_01 GetSellerDetails with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  A01
    ${SellerId}=  RegisterSellerID
    GetSellerDetails  ${EMPTY}  @{escrowCompId}  ${SellerId}  A01  Invalid access token

TC_02 GetSellerDetails with Invalid JWT Token
    [Documentation]  Invalid : To verify response for Invalid JWT token
    [Tags]  A01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}2c2p  @{escrowCompId}  ${SellerId}  A01  Invalid access token

TC_03 GetSellerDetails with Expired JWT Token
    [Documentation]  Invalid : To verify response for Expired JWT token
    [Tags]  A02
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    Sleep  7 minutes
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  A02  Access token expired

TC_04 GetSellerDetails with Other Company JWT TOken
    [Documentation]  Invalid: To check API response with other company JWT token
    [Tags]  A01
    ${TokenEscrow}=  GetToken BIGC
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  A01  Invalid access token

TC_05 GetSellerDetails with Valid JWT Token
    [Documentation]  Valid: To check API response with valid JWT token
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success