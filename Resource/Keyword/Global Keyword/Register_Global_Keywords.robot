*** Settings ***
Resource    Get Token.robot
Resource    ../../Keyword/Register_Seller_API.robot
*** Variables ***
${MobNo1}
${enum}
${email}
${mobileNo}
${IdNumber}
${IdNum1}
${IdNumber1}
${sellerid}
${escrowCompId_Length}=  YUT234
${IdNumber_more_than_30}
${mobile23}

*** Keywords ***
Randome_Number
    ${Emailnum}=  Generate Random String  5  [NUMBERS]
    SET GLOBAL VARIABLE  ${enum}  ${Emailnum}
    [Return]  ${enum}

Randome_EmailId
    ${num}=  Randome_Number
    ${emailid}=  SET VARIABLE  pavan${num}@2c2p.com
    SET GLOBAL VARIABLE  ${email}  ${emailid}
    [Return]  ${email}

Randome_MobileNumber
    ${mobile}=   Generate Random String  10   [NUMBERS]
    SET GLOBAL VARIABLE  ${mobileNo}  ${mobile}
    [Return]  ${mobileNo}

Randome_IDNumber
    ${Id}=  Generate Random String  14   [NUMBERS]
    SET GLOBAL VARIABLE  ${IdNumber}  ${Id}
    [Return]  ${IdNumber}

RegisterSellerID
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${sellerid}=  RegisterSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${idNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success
    [Return]  ${sellerid}  ${idNum}