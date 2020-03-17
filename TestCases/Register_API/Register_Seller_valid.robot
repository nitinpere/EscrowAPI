*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Seller_API.robot
#Resource    ../../Resource/Keyword/All Keyword mobileAPI.robot
Resource    ../../Resource/Variable/user data.robot
*** Variables ***

${IdNumber}
${sellerid}
${mobileNo}
${enum}

${escrowCompId_Invalid}=  YUT
${escrowCompId_Length}=  YUT234
${IdNumber_more_than_30}

*** Test Cases ***
Register Seller Valid data
    ${TokenEscrow}=    GetToken Escrow
#    log to console  ${TokenEscrow}
#    ${mobile}    ${ThaiId}    Register User Thai Post    ${TokenTH}    @{Data_for_register_User}    000
#    ${mobile}    ${passcode}    Set Passcode    ${TokenTH}      @{Data_for_register_User}[0]    111111    000
#    ${TokenLogin}=    Login Wallet@Post    ${TokenTH}    ${mobile}    ${passcode}    deviceId    deviceToken    000
#    Register New Virtual Card    ${TokenLogin}    ${ThaiId}    ${passcode}    True    000
RandomeGenerateVaribales with Values
    ${Id4}=  Generate Random String  14   [NUMBERS]
    SET GLOBAL VARIABLE  ${IdNumber}  ${Id4}
    ${Id1}=  Generate Random String  35   [NUMBERS]
    SET GLOBAL VARIABLE  ${IdNumber_more_than_30}  ${Id1}
    ${mobile}=   Generate Random String  10   [NUMBERS]
    SET GLOBAL VARIABLE  ${mobileNo}  ${mobile}
    ${Emailnum}=  Generate Random String  3  [NUMBERS]
    SET GLOBAL VARIABLE  ${enum}  ${Emailnum}


TC_09 RegisterNewSeller Empty Mandatory Field
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller WITH Empty mandatoryfield @post   ${TokenEscrow}  ${None}  ${None}  ${None}  ${None}  000

TC_10 RegisterNewSeller Empty escrowCompanyId
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}     ${None}   ${IdNumber}  ${1}  ${0}  000

TC_11 RegisterNewSeller invalid escrowCompanyId
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}     ${escrowCompId_Invalid}   ${IdNumber}  ${1}  ${0}  000

TC_12 RegisterNewSeller length more than 3 escrowCompanyId
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller WITH extralength escrowCompanyId @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber}  ${1}  ${0}  000

TC_14 RegisterNewSeller valid data
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  000

TC_15 RegisterNewSeller length more than 30 idNumber
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller WITH extralength idNumber @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber_more_than_30}  ${1}  ${0}  000

TC_16 RegisterNewSeller typeID not enter
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller typeID NOT THERE @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber}   ${None}    ${0}  000
TC_17 RegisterNewSeller IDnumber not enter 1 kyc
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller IDnumber is not enter kyc is 1 @post   ${TokenEscrow}      @{IDno_not_enter_kyc_1}[0]      @{IDno_not_enter_kyc_1}[1]      @{IDno_not_enter_kyc_1}[2]      @{IDno_not_enter_kyc_1}[3]      @{IDno_not_enter_kyc_1}[4]        ${None}   ${1}    ${1}  000

TC_18 RegisterNewSeller IDnumber not enter 0 kyc
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller IDnumber is not enter kyc is 0 @post   ${TokenEscrow}      @{IDno_not_enter_kyc_0}[0]      @{IDno_not_enter_kyc_0}[1]      ${mobileNo}    ${0}    000

TC_19 RegisterNewSeller IDnumber valid 0 kyc
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller IDnumber is valid kyc is 0 @post   ${TokenEscrow}  @{escrowCompId}  ${Id}  ${1}  ${0}  000

TC_20 RegisterNewSeller typeID citizenID valid 0 kyc
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller typeID citizenID is valid kyc is 0 @post   ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${1}  ${0}    000

TC_21 RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${2}  ${0}    000

TC_22 RegisterSeller typeOfId equalsto others is valid kyc is 0 @post
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller typeOfId equalsto others is valid kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${3}  ${0}    000

TC_23 RegisterSeller duplicate_ID_NO Diff TYPEID kyc is 0 @post
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller duplicateIdNO Diff TYPEID kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${IdNumber}  ${3}  ${0}    000

TC_24 RegisterNewSeller IDnumber enter 1 kyc
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller IDnumber enter kyc is 1 @post   ${TokenEscrow}      @{IDno_enter_kyc_1}[0]      @{IDno_enter_kyc_1}[1]      @{IDno_enter_kyc_1}[2]      @{IDno_enter_kyc_1}[3]      @{IDno_enter_kyc_1}[4]    ${Id}   ${1}    ${1}  000

