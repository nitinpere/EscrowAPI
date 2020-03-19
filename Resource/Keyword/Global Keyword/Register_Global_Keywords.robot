*** Settings ***

*** Variables ***
${enum}
${email}
${mobileNo}
${IdNumber}
${sellerid}
${escrowCompId_Invalid}=  YUT
${escrowCompId_Length}=  YUT234
${IdNumber_more_than_30}
${mobile23}
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


