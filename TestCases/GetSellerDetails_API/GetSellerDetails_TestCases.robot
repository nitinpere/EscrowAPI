*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/GetSellerDetails_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***

TC_06 GetSellerDetails To Verify Response
    [Documentation]  Valid: To Verify response  parameter of get Seller detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_08 GetSellerDetails with Empty Body
    [Documentation]  Invalid: To verify Response when all request fields are entered empty without body
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    GetSellerDetails  ${TokenEscrow}  ${EMPTY}  ${EMPTY}  E05  Missing mandatory field

TC_09 GetSellerDetails with Valid EscrowID and Mandatory Fields
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_10 GetSellerDetails with all registered Data
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with all data
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_11 GetSellerDetails with Invalid EscrowCompanyID
    [Documentation]  Invalid: To check API response when escrowCompanyId parameter is entered Invalid and request is sent with mandatory fields
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  999  ${SellerId}  E08  Data not found


