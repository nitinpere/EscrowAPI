*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***
TC_01 GetSellerDetails with Empty JWT Token
    [Documentation]  Empty : To verify response for Empty JWT token
    [Tags]  thisone
    ${SellerId}=  RegisterSellerID
