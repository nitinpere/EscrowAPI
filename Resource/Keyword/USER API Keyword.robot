*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Keywords ***
LogIn
    [Arguments]    ${Token}    ${mobile}    ${passcode}    ${deviceId}    ${deviceToken}    ${corporateCode}
    Log    ${Token}
    Create Session    ThPostMobile    https://uat-thpost.2c2p.com/GipMobile/api/v1/
    ${body}    Create Dictionary    mobileNo=${mobile}    passcode=${passcode}    deviceId=${deviceId}    deviceToken=${deviceToken}    corporateCode=${corporateCode}
    ${OauthToken}=    Set Variable    bearer ${Token}
    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${OauthToken}
    ${response}=    POST Request    ThPostMobile    /login    data=${body}    headers=${header}
    Log    ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['ResponseCode']}    000
    Should be Equal as Strings    ${response.json()['ResDescription']}    Success