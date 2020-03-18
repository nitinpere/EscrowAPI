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
${mobile23}

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
    [Documentation]  Empty : To verify Response when all request fields are entered empty without body
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller WITH Empty mandatoryfield @post   ${TokenEscrow}  ${None}  ${None}  ${None}  ${None}  000

TC_10 RegisterNewSeller Empty escrowCompanyId
    [Documentation]  Empty: To verify response when escrowCompanyId parameter is not entered and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}     ${None}   ${IdNumber}  ${1}  ${0}  000

TC_11 RegisterNewSeller invalid escrowCompanyId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered invalid and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}     ${escrowCompId_Invalid}   ${IdNumber}  ${1}  ${0}  000

TC_12 RegisterNewSeller length more than 3 escrowCompanyId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller WITH extralength escrowCompanyId @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber}  ${1}  ${0}  000

TC_13 RegisterNewSeller EscrowIDless than 3 escrowCompanyId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller ESCROWID less than 3 @post   ${TokenEscrow}     @{EScrow_id_less_th3}[0]   ${Id}  ${1}  ${0}  000

TC_14 RegisterNewSeller valid data
    [Documentation]  Valid: To verify response when escrowCompanyId parameter is entered valid and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller   ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  000

TC_15 RegisterNewSeller length more than 30 idNumber
    [Documentation]  Invalid: To Verify response if idNumber paramter is  entered more than size 30 and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller WITH extralength idNumber @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber_more_than_30}  ${1}  ${0}  000

TC_16 RegisterNewSeller typeID not enter
    [Documentation]  Invalid: To Verify response if idNumber paramter is  entered and  typeOfId is NOT entered and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller typeID NOT THERE @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber}   ${None}    ${0}  000

TC_17 RegisterNewSeller IDnumber not enter 1 kyc
    [Documentation]  Empty: To Verify response if idNumber paramter is  NOT entered and KYCRequest’ = 1 and request sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller IDnumber is not enter kyc is 1 @post   ${TokenEscrow}      @{IDno_not_enter_kyc_1}[0]      @{IDno_not_enter_kyc_1}[1]      @{IDno_not_enter_kyc_1}[2]      @{IDno_not_enter_kyc_1}[3]      @{IDno_not_enter_kyc_1}[4]        ${None}   ${1}    ${1}  000

TC_18 RegisterNewSeller IDnumber not enter 0 kyc
    [Documentation]  Valid: To Verify response if idNumber paramter is  NOT entered and KYCRequest’ = 0 and request sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller IDnumber is not enter kyc is 0 @post   ${TokenEscrow}      @{IDno_not_enter_kyc_0}[0]      @{IDno_not_enter_kyc_0}[1]      ${mobileNo}    ${0}    000

TC_19 RegisterNewSeller IDnumber valid 0 kyc
    [Documentation]  Valid: To Verify response if idNumber paramter is entered valid and KYCRequest’ = 0 and request sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller IDnumber is valid kyc is 0 @post   ${TokenEscrow}  @{escrowCompId}  ${Id}  ${1}  ${0}  000

TC_20 RegisterNewSeller typeID citizenID valid 0 kyc
    [Documentation]  Valid: To Verify response when typeOfId = Citizen id, KYCRequest = 0 and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller typeID citizenID is valid kyc is 0 @post   ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${1}  ${0}    000

TC_21 RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post
    [Documentation]  Valid: To Verify response when  typeOfId = Passport, KYCRequest = 0 and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${2}  ${0}    000

TC_22 RegisterSeller typeOfId equalsto others is valid kyc is 0 @post
    [Documentation]  Valid: To Verify response when  typeOfId = Others, KYCRequest = 0  and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller typeOfId equalsto others is valid kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${3}  ${0}    000

TC_23 RegisterSeller duplicate_ID_NO Diff TYPEID kyc is 0 @post
    [Documentation]  Valid: To Verify response with duplicate "idNumber" but typeOfId is diffrent from orignal, KYCRequest = 0 and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller duplicateIdNO Diff TYPEID kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${IdNumber}  ${3}  ${0}    000

TC_24 RegisterNewSeller IDnumber enter 1 kyc
    [Documentation]  Valid: To Verify response if idNumber paramter is entered valid and KYCRequest’ = 1 and request sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller IDnumber enter kyc is 1 @post   ${TokenEscrow}      @{IDno_enter_kyc_1}[0]      @{IDno_enter_kyc_1}[1]      @{IDno_enter_kyc_1}[2]      @{IDno_enter_kyc_1}[3]      @{IDno_enter_kyc_1}[4]    ${Id}   ${1}    ${1}  000

TC_25 RegisterSeller duplicate_ID_NO Belong to seller status @post
    [Documentation]  Valid : To check idNumber is entered duplicate (duplicate id number should belong to Seller status = terminated ) and request is send with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller duplicateIdNO Belong to sellerID @post  ${TokenEscrow}      @{escrowCompId}[0]  ${IdNumber}  ${2}  ${0}    000

TC_26 RegisterSeller duplicate_IDnumber @post
    [Documentation]  Valid : To check idNumber is entered duplicate and request is send with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller duplicateIdNumber @post  ${TokenEscrow}      @{escrowCompId}[0]  ${IdNumber}  ${1}  ${0}    000

TC_27 RegisterNewSeller NotENTER TYPEOFID kyc is 1
    [Documentation]  Empty: To Verify response if we NOT enter typeOfId and request is sent with all mandatory fields with KYCRequest=1 and Valid IdNumber
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Generate Random String  14   [NUMBERS]
    ${sellerid_locaL}=  RegisterSeller NotENTER TYPEOFID kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${Idr}  ${None}  ${1}  000

TC_28 RegisterNewSeller TYPEOFID is enter IDNO not enter kyc is 1
    [Documentation]  Empty: To Verify response when typeOfId is entered and IdNumber is NOT entered, request is sent with all mandatory fields with KYCRequest=1 and Valid IdNumber
    ${TokenEscrow}=  GetToken Escrow
    ${sellerid_locaL}=  RegisterSeller NotENTER TYPEOFID kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${None}  ${1}  ${1}  000

TC_29 RegisterNewSeller TYPEOFID,IDNO kyc is 1
    [Documentation]  Valid : To Verify response if we enter valid typeOfId and request is sent with all mandatory fields with KYCRequest=1 and valid IdNumber
    ${TokenEscrow}=  GetToken Escrow
    ${Idnumber1}=  Generate Random String  14   [NUMBERS]
    RegisterSeller valid TYPEOFID,IDNO kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${Idnumber1}  ${1}  ${1}  000

TC_30 RegisterNewSeller TYPEOFID is equal two citizen kyc is 1
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Idnumber1}=  Generate Random String  14   [NUMBERS]
    RegisterSeller valid TYPEOFID is equal two citizen kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${Idnumber1}  ${1}  ${1}  000

TC_31 RegisterNewSeller TYPEOFID is equal_to passport kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Idno}=  Generate Random String  14   [NUMBERS]
    ${mobile23}=   Generate Random String  10   [NUMBERS]
    RegisterSeller valid TYPEOFID is equal_to passport kyc is 0 @post  ${TokenEscrow}  @{type_id_passport}[0]  @{type_id_passport}[1]  @{type_id_passport}[2]  @{type_id_passport}[3]  @{type_id_passport}[4]  ${mobile23}  @{type_id_passport}[5]  @{type_id_passport}[6]    ${Idno}  ${2}  ${0}  000

TC_32 RegisterNewSeller TYPEOFID is equal_to others kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Generate Random String  14   [NUMBERS]
    ${mobile24}=   Generate Random String  10   [NUMBERS]
    RegisterSeller valid TYPEOFID is equal_to others kyc is 0 @post  ${TokenEscrow}  @{type_id_passport}[0]  @{type_id_passport}[1]  @{type_id_passport}[2]  @{type_id_passport}[3]  @{type_id_passport}[4]  ${mobile24}  @{type_id_passport}[5]  @{type_id_passport}[6]    ${Idr}  ${3}  ${0}  000
TC_33 RegisterNewSeller Invalid TYPEOFID kyc is 1
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Generate Random String  14   [NUMBERS]
    RegisterSeller Invalid TYPEOFID kyc is 1 @post  ${TokenEscrow}  @{type_id_passport}[0]  @{type_id_passport}[1]  @{type_id_passport}[2]  @{type_id_passport}[3]  @{type_id_passport}[4]  ${Idr}  ${33}  ${1}  000

TC_34 RegisterNewSeller Empty Mobilecountrycode kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Generate Random String  14   [NUMBERS]
    ${mobile2}=   Generate Random String  10   [NUMBERS]
    RegisterSeller Empty mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{Empty_mobile_country_code}[0]  ${None}  ${mobile2}  ${0}  000

TC_35 RegisterNewSeller Invalid Mobilecountrycode kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${mobile2}=   Generate Random String  10   [NUMBERS]
    RegisterSeller mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{Invalid_mobile_country_code}[0]  ${Invalid_mobile_country_code}[1]  ${mobile2}  ${0}  000

TC_36 RegisterNewSeller valid Mobilecountrycode kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${mobile2}=   Generate Random String  10   [NUMBERS]
    RegisterSeller mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  @{valid_mobile_country_code}[1]  ${mobile2}  ${0}  000

TC_37 RegisterNewSeller valid Mobilecountrycode kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller Empty mobileno kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  @{valid_mobile_country_code}[1]  ${None}  ${0}  000

TC_38 RegisterNewSeller valid Mobilecountrycode kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${mobile2}=   Generate Random String  10   [NUMBERS]
    RegisterSeller Empty mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${None}  ${mobile2}  ${0}  000

TC_39 RegisterNewSeller mobileno length morethan 50 kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
    ${TokenEscrow}=  GetToken Escrow
    ${mobile2}=   Generate Random String  55   [NUMBERS]
    RegisterSeller mobileno length morethan50 kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  @{valid_mobile_country_code}[1]  ${mobile2}  ${0}  000