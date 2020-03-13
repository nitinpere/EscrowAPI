*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Resource    ../Variable/CompanyCode.robot
Resource    ../Variable/ErrorCode.resource
Resource    Get Token.robot
*** Keywords ***

RegisterSeller
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['ResponseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}

    [Return]  ${response}
RegisterSeller WITH invalidescrowCompanyID @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyID_exeed_length=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['ResponseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}

    [Return]  ${response}
RegisterSeller WITH Empty mandatoryfield @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['ResponseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}

    [Return]  ${response}


