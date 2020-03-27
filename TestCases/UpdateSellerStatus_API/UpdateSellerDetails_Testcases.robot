*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/UpdateSellerDetails_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***
TC_07 Request Update Seller Details API
    [Documentation]  Valid: To Verify response  parameter of Update Seller Detail API
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId  #RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${0}  000  Success

TC_08 Empty body
    [Documentation]  Empty : To verify Response when all request fields are entered empty without body
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    UpdateSellerDetails_kyc  ${None}  ${None}  ${None}  ${}  E05  Missing mandatory field

TC_09 Empty body Update Seller Details API
    [Documentation]   Empty : To verify Response when request is send with mandatory fields and other fields are send as "".
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}=  Get_SellerId
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${None}  ${0}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${None}  ${0}  000  Success

TC_10 Seller_Details_API Empty EscrowCompId
    [Documentation]  Empty : To check API response when escrowCompanyId parameter is entered empty and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  ${None}  ${SellerId}  ${0}  E05  Missing mandatory field

TC_11 Seller_Details_API Valid EscrowCompId
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${0}  000  Success

TC_12 Seller_Details_API Invalid EscrowCompId
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId_Invalid}[0]  ${SellerId}  ${0}  E03  Invalid request

TC_13 Seller_Details_API Length more 3 EscrowCompId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompanyID_exeed_length}[0]  ${SellerId}  ${0}  E11  Data length is over limit

TC_14 Seller_Details_API Length less 3 EscrowCompId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{EScrow_id_less_th3}[0]  ${SellerId}  ${0}  E03  Invalid request

TC_15 Selle_Details_API Empty SellerId
    [Documentation]  Empty : To check API response when sellerId parameter is entered empty and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${None}  ${0}  E05  Missing mandatory field

TC_16 Selle_Details_API Invalid SellerId
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields (seller Id not existing in company)
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${0}  E03  Invalid request

TC_17 Selle_Details_API SellerId More than 36
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields (seller Id not existing in company)
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}12  ${0}  E11  Data length is over limit

TC_18 Selle_Details_API Duplicate idNum
    [Documentation]  Invalid: To Verify response if idNumber parameter is  entered more than size 30 and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken BIGC
    ${idNum}=  Randome_IDNumber
    SET GLOBAL VARIABLE  ${IdNumber1}  ${idNum}
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${IdNumber1}456  ${3}  ${0}  A01  Invalid access token

TC_19 Selle_Details_API idNum
    [Documentation]  Invalid: To Verify response if idNumber parameter is  entered more than size 30 and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken BIGC
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${IdNumber1}  ${3}  ${0}  U01  Duplicate ID card, email or mobile no


