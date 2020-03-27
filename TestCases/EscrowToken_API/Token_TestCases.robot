*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Register_Seller_API.robot
Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
Resource    ../../Resource/Keyword/UpdateSellerDetails_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***

#  Register Seller Token Test Cases

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




#  Update Seller Status Token Test Cases

TC_01 UpdateSellerStatus with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisone
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${None}  @{escrowCompId}  ${SellerId}  ${4}  A01  Invalid access token

TC_02 UpdateSellerStatus with Invalid JWT Token
    [Documentation]  Invalid : To verify response for Invalid JWT token
    [Tags]  thisone
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}2c2p  @{escrowCompId}  ${SellerId}  ${4}  A01  Invalid access token

TC_04 UpdateSellerStatus with Other Company JWT Token
    [Documentation]  Invalid: To check API response with other company JWT token.
    [Tags]  thisone
    ${TokenEscrow}=  GetToken BIGC
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${4}  A01  Invalid access token

TC_05 UpdateSellerStatus with Valid JWT Token
    [Documentation]  Valid: To check API response with valid JWT token.
    [Tags]  thisone
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${1}  000  Success

TC_03 UpdateSellerStatus with Expired JWT Token
    [Documentation]  Invalid : To verify response for Expired JWT token
    [Tags]  thisone
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    Sleep  7 minutes
    UpdateSeller   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${1}  A02  Access token expired

# Update Seller Details Token Test Cases

TC_01 UpdateSellerDetails with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisoneq
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails   ${None}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token

TC_02 UpdateSellerDetails with Invalid JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisoneq
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails   ${TokenEscrow}2c2p  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token



TC_04 UpdateSellerDetails with other company JWT token.
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisoneq
    ${TokenEscrow}=  GetToken BIGC
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token

TC_05 UpdateSellerDetails with valid JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisoneq
    ${TokenEscrow}=  GetToken BIGC
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A01  Invalid access token

TC_03 UpdateSellerDetails with Expired JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisoneq
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  Get_SellerId
    Sleep  7 minutes
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${idNum}  ${1}  ${0}  A02  Access token expired
TC_06 UpdateSellerDetails request parameter of Update
    [Documentation]  Valid: To Verify request parameters of Register Seller API
    [Tags]  thisoneqq
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}=  Get_SellerId
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success
