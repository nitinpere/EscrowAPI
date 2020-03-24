*** Settings ***

*** Variables ***

${enum}
${email}
${mobileNo}
${IdNumber}
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


