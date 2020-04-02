*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Variable/user data.robot
Resource    All Keywords EscrowAPI.robot
*** Keywords ***

VerifySellerDetails
    [Arguments]   ${Token}  ${escrowCompanyID}  ${SELLERId}
    Create Session  GetUpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  sellerID=${SELLERId}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  GetUpdateSeller  /seller/detail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200

GetSellerDetails
    [Arguments]   ${Token}  ${escrowCompanyID}  ${SELLERId}  ${ResponseCode}  ${ResponseDescription}
    Create Session  GetUpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  sellerID=${SELLERId}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  GetUpdateSeller  /seller/detail  data=${body}  headers=${header}
    #Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

GetSellerDetails ReturnAttribute
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${Argument}
    Create Session  GetUpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  sellerID=${SELLERId}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  GetUpdateSeller  /seller/detail  data=${body}  headers=${header}
    #Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]   ${response.json()['${Argument}']}
