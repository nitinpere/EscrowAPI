*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Keywords ***
Register User Thai Post
    [Arguments]      ${Token}    ${mobile}    ${firstName}    ${lastName}    ${ThaiId}    ${laserId}    ${dateOfBirth}    ${email}    ${naionality}    ${corporateCode}    ${registerChannelId}
    Log    ${Token}
    Create Session    ThPostMobile    https://uat-thpost.2c2p.com/GipMobile/api/v1/
    ${body}    Create Dictionary    mobileNo=${mobile}    firstName=${firstName}    lastName=${lastName}    thaiId=${ThaiId}    laserId=${laserId}    dateOfBirth=${dateOfBirth}    email=${email}    naionality=${naionality}    corporateCode=${corporateCode}    registerChannelId=${registerChannelId}
    ${OauthToken}=    Set Variable    bearer ${Token}
    ${header}    Create Dictionary    Content-Type=application/json    Authorization=${OauthToken}
    ${response}=    POST Request    ThPostMobile    /register    data=${body}    headers=${header}
    Log    ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['ResponseCode']}    000
    Should be Equal as Strings    ${response.json()['ResDescription']}    Success
    