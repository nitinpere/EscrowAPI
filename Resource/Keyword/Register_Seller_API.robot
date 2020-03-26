*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Variable/user data.robot
Resource    Global Keyword/Get Token.robot
*** Keywords ***

RegisterSeller
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}

RegisterSeller WITH invalidescrowCompanyID @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyID_exeed_length=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller with valid Data

    [Arguments]  ${Token}  ${escrowCompanyID}  ${idNumber}  ${typeofID}  ${MobCountryCode}  ${MobNo}  ${emailid}  ${gender}  ${EnTitle}  ${EnFirstName}  ${EnLastName}  ${LocalTitle}  ${LocalFistName}  ${LocalLastName}  ${dob}  ${Nationality}  ${Verification}  ${WorkPlace}  ${UserDef1}  ${UserDef2}  ${UserDef3}  ${UserDef4}  ${UserDef5}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${UserAddress}  Create Dictionary  homeAddress1=@{Address}[0]  homeAddress2=@{Address}[1]  countryId=@{Address}[2]  stateId=@{Address}[3]  state=@{Address}[4]  postalCode=@{Address}[5]  addressDefine1=@{Address}[6]  addressDefine2=@{Address}[7]  addressDefine3=@{Address}[8]  addressDefine4=@{Address}[9]
    ${MailAddress}  Create Dictionary  mailAddress1=@{MailingAddress}[0]  mailAddress2=@{MailingAddress}[1]  countryId=@{Address}[2]  stateId=@{MailingAddress}[2]  state=@{Address}[4]  postalCode=@{MailingAddress}[3]  addressDefine1=@{Address}[6]  addressDefine2=@{Address}[7]  addressDefine3=@{Address}[8]  addressDefine4=@{Address}[9]
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  mobileCountryCode=${MobCountryCode}  mobileNo=${MobNo}  email=${emailid}  gender=${gender}  titleEn=${EnTitle}  firstNameEn=${EnFirstName}  lastNameEn=${EnLastName}  titleLocal=${LocalTitle}  firstNameLocal=${LocalFistName}  lastNameLocal=${LocalLastName}  dateOfBirth=${dob}  nationalityId=${Nationality}  otherVerification=${Verification}  workPlace=${WorkPlace}  userDefine1=${UserDef1}  userDefine2=${UserDef2}  userDefine3=${UserDef3}  userDefine4=${UserDef4}  userDefine5=${UserDef5}  kycRequest=${KeyReq}  address=${UserAddress}  mailingAddress=${MailAddress}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}
    [Return]  ${response.json()['sellerId']}

RegisterSeller WITH Empty mandatoryfield @post
    [Arguments]    ${Token}    ${None}    ${None}    ${None}    ${None}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${body}  Create Dictionary  escrowCompanyId=${None}  idNumber=${None}  typeOfId=${None}  kycRequest=${None}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller WITH Empty escrowCompanyId @post
    [Arguments]    ${Token}    ${None}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${None}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller WITH Invalid escrowCompanyId
     [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller WITH extralength escrowCompanyId @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller WITH extralength idNumber @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller typeID NOT THERE @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${None}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller IDnumber is not enter kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${None}     ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  otherVerification=${otherVerification}    typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}

RegisterSeller IDnumber is not enter kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${mobileNo}      ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    mobileCountryCode=${mobileCountryCode}      mobileNo=${mobileNo}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller IDnumber is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyID=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller ESCROWID less than 3 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller typeID citizenID is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller typeOfId equalsto others is valid kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller duplicateIdNO Diff TYPEID kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller IDnumber enter kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfID}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}    typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller duplicateIdNO Belong to sellerID @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}

RegisterSeller duplicateIdNO @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller duplicateIdNumber @post
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeID}    kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}

RegisterSeller NotENTER TYPEOFID kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${None}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller TYPEOFID is enter IDNO not enter kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${None}     ${typeOfId}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${None}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller valid TYPEOFID,IDNO kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller valid TYPEOFID is equal two citizen kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller valid TYPEOFID is equal_to passport kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${email}  ${mobileCountryCode}  ${mobileNo}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  email=${email}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}



RegisterSeller valid TYPEOFID is equal_to others kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${email}  ${mobileCountryCode}  ${mobileNo}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  email=${email}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}



RegisterSeller Invalid TYPEOFID kyc is 1 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}    ${idNumber}     ${typeOfId}    ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeOfId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller Empty mobileCountryCode kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${None}  ${mobileNo}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${None}  mobileNo=${mobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller mobileCountryCode kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${mobileNo}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller Empty mobileno kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${None}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${mobileCountryCode}  mobileNo=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller mobileno length morethan50 kyc is 0 @post
    [Arguments]    ${Token}    ${escrowCompanyID}  ${mobileCountryCode}  ${mobileNo}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${mobileCountryCode}  mobileNo=${mobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}   ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}   ${ResponseDescription}


RegisterSeller MobileNo
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller Email
    [Arguments]  ${Token}  ${escrowCompanyID}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with Email
    [Arguments]  ${Token}  ${escrowCompanyID}  ${InvalidEmail}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${InvalidEmail}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with Genter
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with titleEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${titleEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleEn=${titleEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with Empty titleEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleEn=${None}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with titleEn size 6
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${titleEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleEn=${titleEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with firstNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${firstNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameEn=${firstNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with Empty firstNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameEn =${None}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with inavalid firstNameEn size 101
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${firstNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameEn=${firstNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with lastNameEgn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${lastNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn=${lastNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with Empty lastNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn =${None}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with inavalid lastNameEn size 101
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${lastNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn=${lastNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with Title
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${Title}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  titleLocal=${Title}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}


RegisterSeller with FirstName @kyc=1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${typeOfID}  ${idNumber}  ${firstNameLocal}  ${lastNameLocal}  ${dob}  ${OtherVerfication}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${body}  Create Dictionary   escrowCompanyId=${escrowCompanyID}  typeOfId=${typeID}  idNumber=${idNumber}   firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dob}  otherVerification=${OtherVerfication}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with FirstName
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${FirstName}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  firstNameLocal=${FirstName}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with Valid LastName @Kyc=1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${typeOfId}  ${idNumber}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with LastName
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${LastName}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameLocal=${LastName}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSellerNOT enter lastNameLocal
    [Arguments]  ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${None}  ${dateOfBirth}  ${otherVerification}    ${idNumber}  ${typeOfId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${None}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with Empty lastName
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${None}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  lastNameEn =${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller enter lastNameLocal
    [Arguments]  ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}  ${idNumber}  ${typeOfId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller withvalid dateOfBirth
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${dateOfBirth}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  dateOfBirth=${dateOfBirth}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Empty dateOfBirth kyc 1
    [Arguments]  ${Token}    ${escrowCompanyID}  ${firstNameLocal}  ${lastNameLocal}  ${None}  ${otherVerification}    ${idNumber}  ${typeOfId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${None}  otherVerification=${otherVerification}  idNumber=${idNumber}  typeOfId=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Empty dateOfBirth kyc 0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${lastNameLocal}  ${dateOfBirth}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobileCountryCode=${MobileCountryCode}  MobileNo=${MobileNo} lastNameLocal=${lastNameLocal}  dateOfBirth=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Invalid dateOfBirth kyc 0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${dateOfBirth}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobileCountryCode=${MobileCountryCode}  MobileNo=${MobileNo}  dateOfBirth=${dateOfBirth}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Empty nationalityId kyc 0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${lastNameLocal}  ${None}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobileCountryCode=${MobileCountryCode}  MobileNo=${MobileNo} lastNameLocal=${lastNameLocal}  nationalityId=${None}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Invalid nationalityId kyc 0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${nationalityId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobileCountryCode=${MobileCountryCode}  MobileNo=${MobileNo}  nationalityId=${nationalityId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller valid nationalityId kyc 0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${nationalityId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobileCountryCode=${MobileCountryCode}  MobileNo=${MobileNo}  nationalityId=${nationalityId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with OtherVerification kyc1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${typeOfID}  ${idNumber}  ${FirstName}  ${LastName}  ${dateOfBirth}  ${otherVerification}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  typeOfId=${typeOfID}  idNumber=${idNumber}  firstNameLocal=${FirstName}  lastNameLocal=${LastName}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with OtherVerification kyc0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobileCountryCode}  ${MobileNo}  ${otherVerification}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  mobileCountryCode=${MobileCountryCode}  mobileNo=${MobileNo}  otherVerification=${otherVerification}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with WorkPlace
    [Arguments]  ${Token}  ${escrowCompanyID}  ${idNumber}  ${typeOfID}  ${workplace}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeOfID}  workPlace=${workplace}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with INvalid WorkPlace
    [Arguments]  ${Token}  ${escrowCompanyID}  ${idNumber}  ${typeOfID}  ${workplace}  ${email}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  idNumber=${idNumber}  typeOfId=${typeOfID}  workPlace=${workplace}  email=${email}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with KYC MORE THAN 1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${email}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with userDefine
    [Arguments]  ${Token}  ${escrowCompanyID}  ${email}  ${userDefine1}  ${userDefine2}  ${userDefine3}  ${userDefine4}  ${userDefine5}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  userDefine1=${userDefine1}  userDefine2=${userDefine2}  userDefine3=${userDefine3}  userDefine4=${userDefine4}  userDefine5=${userDefine5}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Empty Kyc
    [Arguments]    ${Token}    ${escrowCompanyID}    ${idNumber}    ${typeOfID}    ${kycRequest}    ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
#    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}    idNumber=${idNumber}    typeOfID=${typeOfID}    kycRequest=${kycRequest}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with EMPTY ADDress
    [Arguments]  ${Token}  ${escrowCompanyID}  ${email}  ${address}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  address=${address}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with ADDress
    [Arguments]  ${Token}  ${escrowCompanyID}  ${email}  ${address}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  address=${address}  kycRequest=${KeyReq}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  address=${address}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with MailingAddress
    [Arguments]  ${Token}  ${escrowCompanyID}  ${email}  ${address}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  mailingAddress=${address}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller Verify SellerId
    [Arguments]  ${Token}  ${escrowCompanyID}  ${email}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  email=${email}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Log to Console  ${response.json()['sellerId']}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with Invalid IdNumber @kyc=1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${typeofID}  ${idNumber}  ${LocalFirstName}  ${LocalLastName}  ${DOB}  ${OtherVerification}   ${kycRequest}    ${ResponseCode}   ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  typeOfId=${typeID}  idNumber=${idNumber}  firstNameLocal=${LocalFirstName}  lastNameLocal=${LocalLastName}  dateOfBirth=${DOB}  otherVerification=${OtherVerification}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

RegisterSeller with Invalid OtherVerification @kyc=1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${typeofID}  ${idNumber}  ${LocalFirstName}  ${LocalLastName}  ${DOB}  ${OtherVerification}   ${kycRequest}    ${ResponseCode}   ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  typeOfId=${typeID}  idNumber=${idNumber}  firstNameLocal=${LocalFirstName}  lastNameLocal=${LocalLastName}  dateOfBirth=${DOB}  otherVerification=${OtherVerification}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/register  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

