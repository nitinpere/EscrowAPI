*** Settings ***

*** Keywords ***
RegisterSeller
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]  ${response.json()['sellerId']}

UpdateSeller
    [Arguments]   ${Token}  ${PayLoad}
    Create Session  UpdateSellerDetails  http://172.31.2.28/escrow_core/api/v1
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSellerDetails  /seller/updatedetail  data=${PayLoad}  headers=${header}
    Log  ${response.text}  console=True
    Should Be Equal As Strings    ${response.status_code}    200

GetDetails
    [Arguments]  ${Token}  ${PayLoad}
    Create Session  GetSellerDetails  http://172.31.2.28/escrow_core/api/v1
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  GetSellerDetails  /seller/detail  data=${PayLoad}  headers=${header}
    Log  ${response.text}  console=True
    Should Be Equal As Strings    ${response.status_code}    200

UpdateStatus
    [Arguments]  ${Token}  ${PayLoad}
    Create Session  UpdateSellerStatus  http://172.31.2.28/escrow_core/api/v1
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSellerStatus  /seller/updatestatus  data=${PayLoad}  headers=${header}
    Log  ${response.text}  console=True
    Should Be Equal As Strings    ${response.status_code}    200
