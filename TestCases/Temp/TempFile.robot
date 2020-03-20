*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/Register_Seller_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***

generate Data
    ${email1}=  Randome_EmailId
    Log to Console  ${email1}