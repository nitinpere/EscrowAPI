*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String  
Resource    ../../Localized/urlOAuth_UAT.robot
Resource    ../../Variable/Client.robot


*** Keyword ***

GetToken Escrow
    Create Session    Session  ${URLEscrowAuthUAT}
    ${header}   Create Dictionary  Content-Type=application/x-www-form-urlencoded
    Set To Dictionary  ${header}  Authorization  Basic ${Client_authKey}
    ${Body}=  Create Dictionary  grant_type=client_credentials
    ${response}=  POST Request  Session  /token  data=${Body}  headers=${header}
    #Log  ${response.text}    console=True
    Should Be Equal As Strings  ${response.status_code}  200
    Log  ${response.json()['accessToken']}
    #Log  ${response.text}
    [Return]   ${response.json()['accessToken']}

