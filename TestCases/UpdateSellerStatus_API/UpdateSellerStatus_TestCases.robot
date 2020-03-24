*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
Resource    ../../Resource/Variable/user data.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
*** Test Cases ***
TC_06
    ${SellerId}=  Get_SellerId
    Log to Console  Seller id is : ${SellerId}

