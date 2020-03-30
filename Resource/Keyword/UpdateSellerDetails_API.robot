*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Variable/user data.robot
Resource    Global Keyword/Get Token.robot
Resource    Global Keyword/Register_Global_Keywords.robot
*** Keywords ***
UpdateSellerDetails
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${idNumber}  ${typeOfID}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  idNumber=${idNumber}  typeOfID=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails_kyc
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails_Empty_kyc
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  kycRequest=${kycRequest}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSeller with valid Data
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${idNumber}  ${typeofID}  ${MobCountryCode}  ${MobNo}  ${emailid}  ${gender}  ${EnTitle}  ${EnFirstName}  ${EnLastName}  ${LocalTitle}  ${LocalFistName}  ${LocalLastName}  ${dob}  ${Nationality}  ${Verification}  ${WorkPlace}  ${UserDef1}  ${UserDef2}  ${UserDef3}  ${UserDef4}  ${UserDef5}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  RegisterNewSeller  http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${UserAddress}  Create Dictionary  homeAddress1=@{Address}[0]  homeAddress2=@{Address}[1]  countryId=@{Address}[2]  stateId=@{Address}[3]  state=@{Address}[4]  postalCode=@{Address}[5]  addressDefine1=@{Address}[6]  addressDefine2=@{Address}[7]  addressDefine3=@{Address}[8]  addressDefine4=@{Address}[9]
    ${MailAddress}  Create Dictionary  mailAddress1=@{MailingAddress}[0]  mailAddress2=@{MailingAddress}[1]  countryId=@{Address}[2]  stateId=@{MailingAddress}[2]  state=@{Address}[4]  postalCode=@{MailingAddress}[3]  addressDefine1=@{Address}[6]  addressDefine2=@{Address}[7]  addressDefine3=@{Address}[8]  addressDefine4=@{Address}[9]
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  idNumber=${idNumber}  typeOfId=${typeID}  mobileCountryCode=${MobCountryCode}  mobileNo=${MobNo}  email=${emailid}  gender=${gender}  titleEn=${EnTitle}  firstNameEn=${EnFirstName}  lastNameEn=${EnLastName}  titleLocal=${LocalTitle}  firstNameLocal=${LocalFistName}  lastNameLocal=${LocalLastName}  dateOfBirth=${dob}  nationalityId=${Nationality}  otherVerification=${Verification}  workPlace=${WorkPlace}  userDefine1=${UserDef1}  userDefine2=${UserDef2}  userDefine3=${UserDef3}  userDefine4=${UserDef4}  userDefine5=${UserDef5}  kycRequest=${KeyReq}  address=${UserAddress}  mailingAddress=${MailAddress}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  RegisterNewSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
#    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails IDNUMBER KYC 1
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${idNumber}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}  ${typeOfID}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  idNumber=${idNumber}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  typeOfID=${typeID}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails KYC 0
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${idNumber}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  idNumber=${idNumber}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails typeOfId equal to others
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${idNumber}  ${firstNameLocal}  ${lastNameLocal}  ${dateOfBirth}  ${otherVerification}  ${typeOfID}  ${kycRequest}  ${email}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${typeID}=  Convert To Integer  ${typeOfID}
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  idNumber=${idNumber}  firstNameLocal=${firstNameLocal}  lastNameLocal=${lastNameLocal}  dateOfBirth=${dateOfBirth}  otherVerification=${otherVerification}  typeOfID=${typeID}  kycRequest=${KeyReq}  email=${email}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails Empty MobileCountryCode
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobCountryCode}  ${SELLERId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobCountryCode=${MobCountryCode}  SELLERId=${SELLERId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails MobileCountrycode mobile
    [Arguments]  ${Token}  ${escrowCompanyID}  ${MobCountryCode}  ${MobNo}  ${SELLERId}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  MobCountryCode=${MobCountryCode}  MobNo=${MobNo}  SELLERId=${SELLERId}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails Email
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${emailid}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  emailid=${emailid}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails Gender
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${gender}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  gender=${gender}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails titleEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${titleEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  titleEn=${titleEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails firstNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${firstNameEn}  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  firstNameEn=${firstNameEn}  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails lastNameEn
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${lastNameEn }  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  lastNameEn =${lastNameEn }  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}

UpdateSellerDetails titleLocal
    [Arguments]  ${Token}  ${escrowCompanyID}  ${SELLERId}  ${titleLocal }  ${kycRequest}  ${ResponseCode}  ${ResponseDescription}
    Create Session  UpdateSeller   http://172.31.2.28/escrow_core/api/v1
    ${KeyReq}=  Convert To Integer  ${kycRequest}
    ${body}  Create Dictionary  escrowCompanyId=${escrowCompanyID}  SELLERId=${SELLERId}  titleLocal =${titleLocal }  kycRequest=${KeyReq}
    ${AuthToken}=  Set Variable  bearer ${Token}
    ${header}  Create Dictionary  Content-Type=application/json  Authorization=${AuthToken}
    ${response}=  POST request  UpdateSeller  /seller/updatedetail  data=${body}  headers=${header}
    Log  ${response.text}    console=True
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseCode']}    ${ResponseCode}
    Should be Equal as Strings    ${response.json()['resDescription']}    ${ResponseDescription}