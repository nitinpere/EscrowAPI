*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/UpdateSellerDetails_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***
TC_07 Request Update Seller Details API
    [Documentation]  Valid: To Verify request parameter of Update Seller Status API
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  Get_SellerId
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${0}  000  Success