*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String  
Resource    ../../Localized/urlOAuth_UAT.robot
Resource    ../../Variable/Client.robot


*** Keyword ***

GetToken Escrow
    Create Session  Session  ${URLEscrowAuthUAT}
    ${header}   Create Dictionary  Content-Type=application/x-www-form-urlencoded
    Set To Dictionary  ${header}  Authorization  Basic ${Client_authKey}
    ${Body}=  Create Dictionary  grant_type=client_credentials
    ${response}=  POST Request  Session  /token  data=${Body}  headers=${header}
    #Log  ${response.text}    console=True
    Should Be Equal As Strings  ${response.status_code}  200
    Log  ${response.json()['accessToken']}
    #Log  ${response.text}
    [Return]   ${response.json()['accessToken']}

GetToken BIGC
    ${userpass}=    Convert To Bytes    ${client_idBIGC}:${client_secretBIGC}
    ${userpass}=    Evaluate    base64.b64encode($userpass)    base64
    log   ${userpass}
    Create Session    Session    ${URLOAuthUAT}
    ${header}    Create Dictionary    Content-Type=text/plain
    Set To Dictionary    ${header}    Authorization    Basic ${userpass}
    ${Body}=    Create Dictionary    grant_type=client_credentials
    ${response}=    POST Request   Session    /token    data=${Body}    headers=${header}
    Log    ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()['access_token']}
    Log    ${response.json()['token_type']}
    Log    ${response.json()['access_token']}
    [Return]    ${response.json()['access_token']}