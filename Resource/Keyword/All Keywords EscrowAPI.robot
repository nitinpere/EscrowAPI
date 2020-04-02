*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    /Global Keyword/Get Token.robot
Resource    /Global Keyword/Register_Global_Keywords.robot
Resource    Register_Seller_API.robot
Resource    UpdateSeller_Status_API.robot
Resource    GetSellerDetails_API.robot
Resource    UpdateSellerDetails_API.robot