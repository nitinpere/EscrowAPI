*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
Resource    ../../Resource/Variable/user data.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
*** Test Cases ***
TC_06
    [Documentation]  Valid: To Verify request parameters of Register Seller API
    ${SellerId}=  Get_SellerId
    ${TokenEscrow}=  GetToken Escrow
    UpdateSeller with valid Data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}  000  Success
TC_07
    ${SellerId}=  Get_SellerId
    Log to Console  Seller id is : ${SellerId}

TC_08
    ${SellerId}=  Get_SellerId
    Log to Console  Seller id is : ${SellerId}

TC_09
    ${SellerId}=  Get_SellerId
    Log to Console  Seller id is : ${SellerId}



