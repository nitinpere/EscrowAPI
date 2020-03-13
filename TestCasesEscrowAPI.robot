*** Settings ***
Library  SeleniumLibrary
Resource  Resource/Keyword/Global Keyword/Get Token.robot
Resource  Resource/Keyword/All Keywords EscrowAPI.robot

*** Variables ***
${escrowCompId}=  001
${IdNumber}
${sellerid}
${mobileNo}
${enum}

*** Test Cases ***
RandomeGenerateVaribales with Values
    ${Id}=  Generate Random String  14   [NUMBERS]
    SET GLOBAL VARIABLE  ${IdNumber}  ${Id}
    ${mobile}=   Generate Random String  10   [NUMBERS]
    SET GLOBAL VARIABLE  ${mobileNo}  ${mobile}
    ${Emailnum}=  Generate Random String  3  [NUMBERS]
    SET GLOBAL VARIABLE  ${enum}  ${Emailnum}

RegisterNewSeller
    ${TokenEscrow}=  GetToken Escrow
    Log to Console  ${IdNumber}
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}  ${escrowCompId}  ${IdNumber}  1  0  #${Token},${escrowCompanyID},${idNumber},${typeOfID},${kycRequest}
    SET GLOBAL VARIABLE  ${sellerid}   ${sellerid_locaL}

UpdateSellerDetails
    Log to Console  ${IdNumber}
    ${TokenEscrow}=  GetToken Escrow
    ${address}=  create dictionary  homeAddress1=homeAddress1  homeAddress2=homeAddress2  countryId=004  stateId=001  state=Bangkok  postalCode=123001  addressDefine1=Define1  addressDefine2=Define2  addressDefine3=Define3  addressDefine4=Define4
    ${mailingAddress}=  create dictionary  mailAddress1=mailAddress1  mailAddress2=mailAddress2  countryId=004  stateId=001  state=bangkok  postalCode=111001  addressDefine1=11  addressDefine2=22  addressDefine3=33  ressDefine4=44
    ${PayLoad}=  create dictionary   escrowCompanyId=${escrowCompId}  sellerId=${sellerid}  idNumber=${IdNumber}  typeOfId=${3}  mobileCountryCode=66  mobileNo=${mobileNo}  email=pavan.p+${enum}@gmail.com  gender=F  titleEn=MR.  firstNameEn=kavita  lastNameEn=Mehra  titleLocal=TH  firstNameLocal=Test  lastNameLocal=Test1  dateOfBirth=02/01/2001  nationalityId=764  otherVerification=AB1215563203  workPlace=test co  userDefine1=1  userDefine2=2  userDefine3=3  userDefine4=4  userDefine5=5  kycRequest=${0}  address=${address}  mailingAddress=${mailingAddress}
    Log to Console  ${PayLoad}
    ${PayBody}=  Evaluate    json.dumps($PayLoad)    json
    Log to Console  ${PayBody}
    UpdateSeller   ${TokenEscrow}  ${PayLoad}

GetSellerDetails
    Log to Console  ${IdNumber}
    ${TokenEscrow}=  GetToken Escrow
    ${PayLoad}=  create dictionary  escrowCompanyId=${escrowCompId}  sellerId=${sellerid}
    GetDetails  ${TokenEscrow}  ${PayLoad}

UpdateSellerStatus
    ${TokenEscrow}=  GetToken Escrow
    ${PayLoad}=  create dictionary  escrowCompanyId=${escrowCompId}  sellerId=${sellerid}  status=${1}
    UpdateStatus  ${TokenEscrow}  ${PayLoad}
