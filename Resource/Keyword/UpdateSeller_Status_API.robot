*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Variable/user data.robot
Resource    All Keywords EscrowAPI.robot
*** Keywords ***

UpdateSeller
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${STATUS}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${STATUS1}=  Convert To Integer  ${STATUS}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  sellerId=${SELLERId}  status=${STATUS1}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatestatus  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSeller to convert
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${STATUS}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${STATUS1}=  Convert To Integer  ${STATUS}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  STATUS=${STATUS1}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatestatus  data=${body}  headers=${header}
#    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200

UpdateSeller Empty
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${STATUS}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    #${STATUS1}=  Convert To Integer  ${STATUS}
    ${STATUS1}=  Set Variable If  "${STATUS}"=="${EMPTY}"    ${null}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  sellerId=${SELLERId}  status=${STATUS1}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatestatus  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
