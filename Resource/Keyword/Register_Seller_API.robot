*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
#Resource    ../Variable/CompanyCode.robot
#Resource    ../Variable/ErrorCode.resource
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
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
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
    [Arguments]    ${Token}    ${None}    ${None}    ${None}    ${None}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
#    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${None}  idNumber=${None}  typeOfId=${None}  kycRequest=${None}
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

RegisterSeller WITH Empty escrowCompanyId @post
     [Arguments]    ${Token}    ${None}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${None}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
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

RegisterSeller WITH Invalid escrowCompanyId @post
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

RegisterSeller WITH extralength escrowCompanyId @post
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

RegisterSeller WITH extralength idNumber @post
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

RegisterSeller typeID NOT THERE @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${None}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${None}  kycRequest=${KeyReq}
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

RegisterSeller IDnumber is not enter kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${None}     ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  otherVerification=${otherVerification}    typeOfId=${typeID}  kycRequest=${KeyReq}
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

RegisterSeller IDnumber is not enter kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${mobileNo}      ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    mobileCountryCode=${mobileCountryCode}      mobileNo=${mobileNo}    kycRequest=${KeyReq}
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

RegisterSeller IDnumber is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyID=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeID}    kycRequest=${KeyReq}
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

RegisterSeller ESCROWID less than 3 @post
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

RegisterSeller typeID citizenID is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
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

RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
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

RegisterSeller typeOfId equalsto others is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
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

RegisterSeller duplicateIdNO Diff TYPEID kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller IDnumber enter kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfID}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  otherVerification=${otherVerification}  idNumber=${idNumber}    typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}
RegisterSeller duplicateIdNO Belong to sellerID @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller duplicateIdNO @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller duplicateIdNumber @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller NotENTER TYPEOFID kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${None}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}



RegisterSeller TYPEOFID is enter IDNO not enter kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${None}     ${typeOfId}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${None}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller valid TYPEOFID,IDNO kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}


RegisterSeller valid TYPEOFID is equal two citizen kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}


RegisterSeller valid TYPEOFID is equal_to passport kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${email}  ${mobileCountryCode}  ${mobileNo}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  email=${email}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller valid TYPEOFID is equal_to others kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${email}  ${mobileCountryCode}  ${mobileNo}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  email=${email}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller Invalid TYPEOFID kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}
RegisterSeller Empty mobileCountryCode kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${None}  ${mobileNo}  ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${None}  mobileNo=${mobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller mobileCountryCode kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${mobileNo}  ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller Empty mobileno kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${None}  ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${mobileCountryCode}  mobileNo=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller mobileno length morethan50 kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${mobileNo}  ${kycRequest}  ${ResponseCode}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
#    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
#    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
#    Should be Equal as Strings    ${response.json()['ResDescription']}    ${${ResponseCode}}
    Log    ${response.json()}
    [Return]  ${response}


RegisterSeller MobileNo
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller Email
    [Arguments]  ${Token}  ${escrowCompanyID}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with Email
    [Arguments]  ${Token}  ${escrowCompanyID}  ${InvalidEmail}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${InvalidEmail}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with Genter
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}
<<<<<<< HEAD

=======

RegisterSeller with Title
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${Title}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleLocal=${Title}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}
RegisterSeller with FirstName
     [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${FirstName}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameLocal=${FirstName}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
   #Log  ${response.text}    console=True
    #log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with LastName
     [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${LastName}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameLocal=${LastName}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    #log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with titleEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${titleEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleEn=${titleEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with Empty titleEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleEn=${None}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with titleEn size 6
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${titleEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleEn=${titleEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with firstNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${firstNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameEn=${firstNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with Empty firstNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameEn =${None}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with inavalid firstNameEn size 101
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${firstNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameEn=${firstNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with lastNameEgn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${lastNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn=${lastNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with Empty lastNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn =${None}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}

RegisterSeller with inavalid lastNameEn size 101
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${lastNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn=${lastNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    Log    ${response.json()}
    [Return]  ${response}



