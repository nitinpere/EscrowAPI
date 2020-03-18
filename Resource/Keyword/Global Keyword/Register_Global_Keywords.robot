*** Settings ***

*** Variables ***
${enum}
${email}
${mobileNo}
*** Keywords ***
Randome_Number
    ${Emailnum}=  Generate Random String  3  [NUMBERS]
    SET GLOBAL VARIABLE  ${enum}  ${Emailnum}
    [Return]  ${enum}

Randome_EmailId
    ${emailid}=  SET VARIABLE  pavan${enum}@2c2p.com
    SET GLOBAL VARIABLE  ${email}  ${emailid}
    [Return]  ${email}

Randome_MobileNumber
    ${mobile}=   Generate Random String  10   [NUMBERS]
    SET GLOBAL VARIABLE  ${mobileNo}  ${mobile}
    [Return]  ${mobileNo}