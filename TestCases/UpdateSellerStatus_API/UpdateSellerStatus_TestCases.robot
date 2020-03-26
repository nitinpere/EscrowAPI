*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
Resource    ../../Resource/Variable/user data.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
*** Test Cases ***
TC_06 Request Update Seller Status API
    [Documentation]  Valid: To Verify request parameter of Update Seller Status API
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success

TC_07 Response Update Seller Status API
    [Documentation]  Valid: To Verify response  parameter of Update Seller Status API
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success

TC_08 Empty EscrowCompanyID
    [Documentation]  Empty : To check API response when escrowCompanyID parameter is entered empty and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  ${None}  ${SellerId}  ${1}  E05  Missing mandatory field

TC_09 EscrowCompanyID parameter is entered Valid
   [Documentation]  Valid: To check API response when escrowCompanyID parameter is entered Valid and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success

TC_10 Invalid EscrowCompanyID
   [Documentation]  Invalid: To check API response when escrowCompanyID parameter is entered Invalid and request is sent with mandatory fields(Except Company Id - 001 of company Kaidee.com)
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{Invalid_Update}[0]  ${SellerId}  ${2}  E03  Invalid request

TC_11 EscrowCompanyId entered more than size 3
   [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{Invalid_Update}[1]  ${SellerId}  ${2}  E03  Invalid request

TC_12 EscrowCompanyId less than size 3
   [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{Invalid_Update}[2]  ${SellerId}  ${2}  E03  Invalid request

TC_13 Empty sellerId
   [Documentation]  Empty : To check API response when sellerId parameter is entered empty and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${None}  ${2}  E05  Missing mandatory field

TC_14 SellerId entered Invalid
   [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${1}  E08  Data not found

TC_15 SellerId more than Size 36
   [Documentation]  Invalid: To check API response when sellerId parameter is entered more than Size 36 and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    ${num}=  Generate Random String  3  [NUMBERS]
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}${num}  ${4}  E08  Data not found

TC_16 SellerId less than Size 36
   [Documentation]  Invalid: To check API response when sellerId parameter is entered less than Size 36 and request is sent with mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${4}  E08  Data not found

TC_17 SellerId Active to Locked Status
   [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is active and request is sent for status Locked
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success

TC_18 SellerId Active to Suspended Status
   [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is active and request is sent for status Suspended
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success

TC_19 SellerId Active to Terminated Status
   [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is active and request is sent for status Terminated
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  000  Success

TC_20 SellerId Locked to Active Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success

TC_21 SellerId Locked to Terminated
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Terminated
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  000  Success

TC_22 SellerId Locked to Suspended
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Suspended
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success

TC_23 SellerId Suspended to Locked
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is suspended and request is sent for status Locked
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success

TC_24 SellerId Suspended to Active
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is suspended and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success

TC_25 SellerId Terminated to Active Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  000  Success

TC_26 SellerId Terminated to Locked Status
    [Tags]    smokie
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  E03  Invalid request

TC_27 SellerId Terminated to Active Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  E03  Invalid request

TC_28 SellerId Terminated to Terminated Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  E03  Invalid request

TC_29 SellerId Terminated to Terminated Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  E03  Invalid request

TC_30 SellerId Invalid Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${6}  E03  Invalid request

TC_31 SellerId Status more than 1
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${16}  E03  Invalid request

TC_32 SellerId Empty Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${None}  E05  Missing mandatory field

TC_33 SellerId Active to Active Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success

TC_34 SellerId Suspended to Suspended Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success

TC_35 SellerId Locked to Locked Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success

