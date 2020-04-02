*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/All Keywords EscrowAPI.robot
Resource    ../../Resource/Variable/user data.robot
Test Setup   Sleep  2s

*** Test Cases ***
TC_06 UpdateSellerStatus Request Update Seller Status API
    [Documentation]  Valid: To Verify request parameter of Update Seller Status API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_07 UpdateSellerStatus Response Update Seller Status API
    [Documentation]  Valid: To Verify response  parameter of Update Seller Status API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_08 UpdateSellerStatus Empty EscrowCompanyID
    [Documentation]  Empty : To check API response when escrowCompanyID parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId_locked}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  ${None}  ${SellerId}  ${1}  E05  Missing mandatory field

TC_09 UpdateSellerStatus EscrowCompanyID parameter is entered Valid
    [Documentation]  Valid: To check API response when escrowCompanyID parameter is entered Valid and request is sent with mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success

TC_10 UpdateSellerStatus Invalid EscrowCompanyID
    [Documentation]  Invalid: To check API response when escrowCompanyID parameter is entered Invalid and request is sent with mandatory fields(Except Company Id - 001 of company Kaidee.com)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{Invalid_Update}[0]  ${SellerId}  ${2}  E03  Invalid request

TC_11 UpdateSellerStatus EscrowCompanyId entered more than size 3
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{Invalid_Update}[1]  ${SellerId}  ${2}  E03  Invalid request

TC_12 UpdateSellerStatus EscrowCompanyId less than size 3
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{Invalid_Update}[2]  ${SellerId}  ${2}  E03  Invalid request

TC_13 UpdateSellerStatus Empty sellerId
    [Documentation]  Empty : To check API response when sellerId parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${None}  ${2}  E05  Missing mandatory field

TC_14 UpdateSellerStatus SellerId entered Invalid
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${1}  E08  Data not found

TC_15 UpdateSellerStatus SellerId more than Size 36
    [Documentation]  Invalid: To check API response when sellerId parameter is entered more than Size 36 and request is sent with mandatory fields
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[1]  ${4}  E08  Data not found

TC_16 UpdateSellerStatus SellerId less than Size 36
    [Documentation]  Invalid: To check API response when sellerId parameter is entered less than Size 36 and request is sent with mandatory fields
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${4}  E08  Data not found

TC_17 UpdateSellerStatus SellerId Active to Locked Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is active and request is sent for status Locked
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_18 UpdateSellerStatus SellerId Active to Suspended Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is active and request is sent for status Suspended
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_19 UpdateSellerStatus SellerId Active to Terminated Status
   [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is active and request is sent for status Terminated
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_20 UpdateSellerStatus SellerId Locked to Active Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Active
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_21 UpdateSellerStatus SellerId Locked to Terminated
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Terminated
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_22 UpdateSellerStatus SellerId Locked to Suspended
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Suspended
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_23 UpdateSellerStatus SellerId Suspended to Locked
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is suspended and request is sent for status Locked
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_24 UpdateSellerStatus SellerId Suspended to Active
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is suspended and request is sent for status Active
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_25 UpdateSellerStatus SellerId Suspended to Terminated
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is suspended and request is sent for status Terminated
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_26 UpdateSellerStatus SellerId Terminated to Locked Status
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Valid which is Terminated and request is sent for status Locked
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  E03  Invalid request
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_27 UpdateSellerStatus SellerId Terminated to Active Status
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Valid which is Terminated and request is sent for status Active
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  E03  Invalid request
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_28 UpdateSellerStatus SellerId Terminated to Terminated Status
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Valid which is Terminated and request is sent for status Suspended
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  E03  Invalid request
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_29 UpdateSellerStatus SellerId Terminated to Terminated Status
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Valid which is Terminated and request is sent for status Terminated
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}  E03  Invalid request
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_30 UpdateSellerStatus SellerId Invalid Status
    [Documentation]  Invalid: To verify response when  status Parameter is entered invalid and request sent with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${6}  E03  Invalid request
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_31 UpdateSellerStatus SellerId Status more than 1
    [Documentation]  Invalid: To verify response when  status Parameter is entered more than size 1 and request sent with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${16}  E03  Invalid request
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_32 UpdateSellerStatus SellerId Empty Status
    [Documentation]  Empty: To verify response when status parameter is entered empty and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller Empty  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  E05  Missing mandatory field
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_33 UpdateSellerStatus SellerId Active to Active Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Active and request is sent for status Active
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_34 UpdateSellerStatus SellerId Suspended to Suspended Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is suspended and request is sent for status suspended
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_35 UpdateSellerStatus SellerId Locked to Locked Status
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid which is Locked and request is sent for status Locked
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idNum}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}
    UpdateSeller  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

