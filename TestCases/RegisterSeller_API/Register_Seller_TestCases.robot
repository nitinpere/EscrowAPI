*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/All Keywords EscrowAPI.robot
Resource    ../../Resource/Variable/user data.robot
Test Setup   Sleep  2s

*** Test Cases ***
Register Seller Valid data
    ${TokenEscrow}=    GetToken Escrow

TC_06 RegisterNewSeller Request with all data
    [Documentation]  Valid: To Verify request parameters of Register Seller API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    RegisterSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${idNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_07 RegisterNewSeller Response with Response Data
    [Documentation]  Valid: To Verify response  parameter of Register Seller API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    RegisterSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${idNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_08 RegsterNewSeller Request with Valid Parameter
    [Documentation]  Valid: To Verify response when request is send with all valid parameters
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    RegisterSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${idNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_09 RegisterNewSeller Empty Mandatory Field
    [Documentation]  Empty : To verify Response when all request fields are entered empty without body
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller WITH Empty mandatoryfield @post   ${TokenEscrow}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  E05  Missing mandatory field

TC_10 RegisterNewSeller Empty escrowCompanyId
    [Documentation]  Empty: To verify response when escrowCompanyId parameter is not entered and request is sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller WITH Empty escrowCompanyId @post   ${TokenEscrow}    ${EMPTY}   ${IdNumber}  ${1}  ${0}  E05  Missing mandatory field

TC_11 RegisterNewSeller invalid escrowCompanyId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered invalid and request is sent with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller WITH Invalid escrowCompanyId  ${TokenEscrow}    @{escrowCompId_Invalid}   ${IdNumber}  ${1}  ${0}  E03  Invalid request


TC_12 RegisterNewSeller length more than 3 escrowCompanyId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller WITH extralength escrowCompanyId @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber}  ${1}  ${0}  E11  Data length is over limit

TC_13 RegisterNewSeller EscrowIDless than 3 escrowCompanyId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller ESCROWID less than 3 @post   ${TokenEscrow}     @{EScrow_id_less_th3}[0]   ${Id}  ${1}  ${0}  E03  Invalid request

TC_14 RegisterNewSeller valid data
    [Documentation]  Valid: To verify response when escrowCompanyId parameter is entered valid and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller   ${TokenEscrow}  @{escrowCompId}  ${IdNumber}  ${1}  ${0}  000  Success

TC_15 RegisterNewSeller length more than 30 idNumber
    [Documentation]  Invalid: To Verify response if idNumber paramter is  entered more than size 30 and request is sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber_more_than_30}=  Generate Random String  31   [NUMBERS]
    RegisterSeller WITH extralength idNumber @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber_more_than_30}  ${1}  ${0}  E11  Data length is over limit

TC_16 RegisterNewSeller typeID not enter
    [Documentation]  Invalid: To Verify response if idNumber paramter is  entered and  typeOfId is NOT entered and request is sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller typeID NOT THERE @post   ${TokenEscrow}     ${escrowCompId_Length}   ${IdNumber}   ${EMPTY}    ${0}  E05  Missing mandatory field

TC_17 RegisterNewSeller IDnumber not enter 1 kyc
    [Documentation]  Empty: To Verify response if idNumber paramter is  NOT entered and KYCRequest’ = 1 and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller IDnumber is not enter kyc is 1 @post   ${TokenEscrow}      @{IDno_not_enter_kyc_1}[0]      @{IDno_not_enter_kyc_1}[1]      @{IDno_not_enter_kyc_1}[2]      @{IDno_not_enter_kyc_1}[3]      @{IDno_not_enter_kyc_1}[4]        ${EMPTY}   ${1}    ${1}  E05  Missing mandatory field

TC_18 RegisterNewSeller IDnumber not enter 0 kyc
    [Documentation]  Valid: To Verify response if idNumber paramter is  NOT entered and KYCRequest’ = 0 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller IDnumber is not enter kyc is 0 @post   ${TokenEscrow}      @{IDno_not_enter_kyc_0}[0]      @{IDno_not_enter_kyc_0}[1]      ${mobileNo}    ${0}    000  Success

TC_19 RegisterNewSeller IDnumber valid 0 kyc
    [Documentation]  Valid: To Verify response if idNumber paramter is entered valid and KYCRequest’ = 0 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller IDnumber is valid kyc is 0 @post   ${TokenEscrow}  @{escrowCompId}  ${Id}  ${1}  ${0}  000  Success

TC_20 RegisterNewSeller typeID citizenID valid 0 kyc
    [Documentation]  Valid: To Verify response when typeOfId = Citizen id, KYCRequest = 0 and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller typeID citizenID is valid kyc is 0 @post   ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${1}  ${0}    000  Success

TC_21 RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post
    [Documentation]  Valid: To Verify response when  typeOfId = Passport, KYCRequest = 0 and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller typeOfId equalsto Passport is valid kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${2}  ${0}    000  Success

TC_22 RegisterSeller typeOfId equalsto others is valid kyc is 0 @post
    [Documentation]  Valid: To Verify response when  typeOfId = Others, KYCRequest = 0  and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller typeOfId equalsto others is valid kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${Id}  ${3}  ${0}    000  Success

TC_23 RegisterSeller duplicate_ID_NO Diff TYPEID kyc is 0 @post
    [Documentation]  Valid: To Verify response with duplicate "idNumber" but typeOfId is diffrent from orignal, KYCRequest = 0 and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    RegisterSeller duplicateIdNO Diff TYPEID kyc is 0 @post  ${TokenEscrow}      @{escrowCompId}[0]  ${IdNumber}  ${3}  ${0}    000  Success

#TC_24 RegisterNewSeller IDnumber enter 1 kyc
#    [Documentation]  Valid: To Verify response if idNumber paramter is entered valid and KYCRequest’ = 1 and request sent with all mandatory fields
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${IdNumber}=  Randome_IDNumber
#    RegisterSeller IDnumber enter kyc is 1 @post   ${TokenEscrow}      @{IDno_enter_kyc_1}[0]      @{IDno_enter_kyc_1}[1]      @{IDno_enter_kyc_1}[2]      @{IDno_enter_kyc_1}[3]      @{IDno_enter_kyc_1}[4]    ${IdNumber}   ${1}    ${1}  000  Success

TC_25 RegisterSeller duplicate_ID_NO Belong to seller status @post
    [Documentation]  Valid : To check idNumber is entered duplicate (duplicate id number should belong to Seller status = terminated ) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${IdNumber}=  Randome_IDNumber
    SET GLOBAL VARIABLE  ${IdNumber1}  ${IdNumber}
    RegisterSeller duplicateIdNO Belong to sellerID @post  ${TokenEscrow}      @{escrowCompId}[0]  ${IdNumber1}  ${2}  ${0}    000  Success

TC_26 RegisterSeller duplicate_IDnumber @post
    [Documentation]  Valid : To check idNumber is entered duplicate and request is send with all mandatory fields
    [Tags]  R03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber2}=  RegisterSellerID with Thai Data
    RegisterSeller duplicateIdNumber @post   ${TokenEscrow}   @{escrowCompId}  ${idnumber2}  ${1}  ${0}   R03  Duplicate ID card, email or mobile no.

TC_27 RegisterNewSeller NotENTER TYPEOFID kyc is 1
    [Documentation]  Empty: To Verify response if we NOT enter typeOfId and request is sent with all mandatory fields with KYCRequest=1 and Valid IdNumber
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Randome_IDNumber
    RegisterSeller NotENTER TYPEOFID kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${Idr}  ${EMPTY}  ${1}  E05  Missing mandatory field

TC_28 RegisterNewSeller TYPEOFID is enter IDNO not enter kyc is 1
    [Documentation]  Empty: To Verify response when typeOfId is entered and IdNumber is NOT entered, request is sent with all mandatory fields with KYCRequest=1 and Valid IdNumber
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller NotENTER TYPEOFID kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${EMPTY}  ${1}  ${1}  E05  Missing mandatory field

#TC_29 RegisterNewSeller TYPEOFID,IDNO kyc is 1
#    [Documentation]  Valid : To Verify response if we enter valid typeOfId and request is sent with all mandatory fields with KYCRequest=1 and valid IdNumber
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${Idnumber1}=  Randome_IDNumber
#    RegisterSeller valid TYPEOFID,IDNO kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${Idnumber1}  ${1}  ${1}  000  Success

#TC_30 RegisterNewSeller TYPEOFID is equal two citizen kyc is 1
#    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and request is sent with all mandatory fields
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${Idnumber1}=  Randome_IDNumber
#    RegisterSeller valid TYPEOFID is equal two citizen kyc is 1 @post  ${TokenEscrow}  @{Not_enter_typeOFID_KYC1}[0]  @{Not_enter_typeOFID_KYC1}[1]  @{Not_enter_typeOFID_KYC1}[2]  @{Not_enter_typeOFID_KYC1}[3]  @{Not_enter_typeOFID_KYC1}[4]  ${Idnumber1}  ${1}  ${1}  000  Success

TC_31 RegisterNewSeller TYPEOFID is equal_to passport kyc is 2
    [Documentation]  Valid: To Verify response when  typeOfId = Passport and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${Idno1}=  Randome_IDNumber
    ${mobile1}=  Randome_MobileNumber
    ${email1}=  Randome_EmailId
    RegisterSeller valid TYPEOFID is equal_to passport kyc is 0 @post  ${TokenEscrow}  @{type_id_passport}[0]  @{type_id_passport}[1]  @{type_id_passport}[2]  ${email1}  @{type_id_passport}[4]  ${mobile1}  @{type_id_passport}[5]  @{type_id_passport}[6]    ${Idno1}  ${2}  ${0}  000  Success

TC_32 RegisterNewSeller TYPEOFID is equal_to others kyc is 0
    [Documentation]  Valid: To Verify response when  typeOfId = Others  and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Randome_IDNumber
    ${mobile}=  Randome_MobileNumber
    ${email}=  Randome_EmailId
    RegisterSeller valid TYPEOFID is equal_to others kyc is 0 @post  ${TokenEscrow}  @{type_id_passport}[0]  @{type_id_passport}[1]  @{type_id_passport}[2]  ${email}  @{type_id_passport}[4]  ${mobile}  @{type_id_passport}[5]  @{type_id_passport}[6]    ${Idr}  ${3}  ${0}  000  Success

#TC_33 RegisterNewSeller Invalid TYPEOFID kyc is 1
#    [Documentation]  Invalid: To Verify response if we enter Invalid typeOfId and request is sent with all mandatory fields with KYCRequest=1 and valid IdNumber
#    [Tags]  R01
#    ${TokenEscrow}=  GetToken Escrow
#    ${Idr}=  Randome_IDNumber
#    RegisterSeller Invalid TYPEOFID kyc is 1 @post   ${TokenEscrow}  @{type_id_passport}[0]  @{type_id_passport}[1]  @{type_id_passport}[2]  @{type_id_passport}[5]  @{Kyc1_Data}[1]   ${Idr}   ${54}   ${1}  R01  Validation failed

TC_34 RegisterNewSeller Empty Mobilecountrycode kyc is 0
    [Documentation]  Invalid To Verify response if mobileCountryCode paramter is entered empty and request sent with all mandatory fields with Mobile number
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${Idr}=  Randome_IDNumber
    ${mobile}=  Randome_MobileNumber
    RegisterSeller Empty mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{Empty_mobile_country_code}[0]  ${EMPTY}  ${mobile}  ${0}  E05  Missing mandatory field

TC_35 RegisterNewSeller Invalid Mobilecountrycode kyc is 0
    [Documentation]  Invalid: To Verify response if mobileCountryCode paramter is  entered invalid(length is more than 10) and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${mobile}=  Randome_MobileNumber
    RegisterSeller mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{Invalid_mobile_country_code}[0]  ${Invalid_mobile_country_code}[1]  ${mobile}  ${0}  E11  Data length is over limit

TC_36 RegisterNewSeller valid Mobilecountrycode kyc is 0
    [Documentation]  Valid: To Verify response if mobileCountryCode paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${mobile}=  Randome_MobileNumber
    RegisterSeller mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  @{valid_mobile_country_code}[1]  ${mobile}  ${0}  000  Success

TC_37 RegisterNewSeller valid Mobilecountrycode kyc is 0
    [Documentation]  Empty: To Verify response if mobileNo paramter is not entered and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller Empty mobileno kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  @{valid_mobile_country_code}[1]  ${EMPTY}  ${0}  E05  Missing mandatory field

TC_38 RegisterNewSeller valid Mobilecountrycode kyc is 0
    [Documentation]  Empty: To Verify response if mobileNo paramter is entered and mobileCountryCode is NOT entered and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${mobile}=  Randome_MobileNumber
    RegisterSeller Empty mobileCountryCode kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${EMPTY}  ${mobile}  ${0}  E05  Missing mandatory field

TC_39 RegisterNewSeller mobileno length morethan 50 kyc is 0
    [Documentation]  Invalid: To Verify response if mobileNo paramter is  entered invalid (length is more than 50) and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${mobile50}=   Generate Random String  51   [NUMBERS]
    RegisterSeller mobileno length morethan50 kyc is 0 @post  ${TokenEscrow}  @{valid_mobile_country_code}[0]  @{valid_mobile_country_code}[1]  ${mobile50}  ${0}  E11  Data length is over limit

TC_40 RegisterNewSeller Valid MobileNo
    [Documentation]  Valid: To Verify response if mobileNo paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${mobile}=  Randome_MobileNumber
    RegisterSeller MobileNo   ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${mobile}  ${0}  000  Success

TC_41 RegisterNewSeller MobileNo without First 0
    [Documentation]  Valid: To Verify response if mobileNo paramter is  entered valid without first digit 0 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${mobile}=  Randome_MobileNumber
    SET GLOBAL VARIABLE  ${mobileNo}  ${mobile}
    RegisterSeller MobileNo   ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${mobile}  ${0}  000  Success

TC_42 RegisterNewSeller Duplicate MobileNo
    [Documentation]  Duplicate: To Verify response if mobileNo paramter is entered which is already registered  and request sent with all mandatory fields
    [Tags]  R03
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller MobileNo  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${mobileNo}  ${0}  R03  Duplicate ID card, email or mobile no.

TC_43 RegisterNewSeller without Email
    [Documentation]  Empty: To Verify response if email paramter is not entered and escrowCompanyId and kycRequest is entered and request sent.
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller Email  ${TokenEscrow}  @{escrowCompId}  ${0}  E05  Missing mandatory field

TC_44 RegisterNewSeller with Invalid Email
    [Documentation]  Invalid: To Verify response if email paramter is  entered invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller with Email  ${TokenEscrow}  @{escrowCompId}  pavan${enum}2c2p.com  ${0}  R01  Validation failed

TC_45 RegisterNewSeller with Valid Email
    [Documentation]  Valid: To Verify response if email paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${emailid}=  Randome_EmailId
    SET GLOBAL VARIABLE  ${email}  ${emailid}
    RegisterSeller with Email  ${TokenEscrow}  @{escrowCompId}  ${email}  ${0}  000  Success

TC_46 RegisterNewSeller with Dublicate Email
    [Documentation]  Duplicate: To Verify response if email paramter is entered which is already registered  and request sent with all mandatory fields
    [Tags]  R03
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller with Email  ${TokenEscrow}  @{escrowCompId}  ${email}  ${0}  R03   Duplicate ID card, email or mobile no.

TC_47 RegisterNewSeller with Duplicate Email which belongs to terminated SellerId
    [Documentation]  Valid : To check Email Address is entered duplicate (duplicate Email Address should belong to Seller status = terminated )and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${emailid}=  Randome_EmailId
    ${Sellerid}=  RegisterSeller with Email  ${TokenEscrow}  @{escrowCompId}  ${emailid}  ${0}  000  Success
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${Sellerid}  ${4}
    RegisterSeller with Email  ${TokenEscrow}  @{escrowCompId}  ${emailid}  ${0}  000  Success

TC_48 RegisterNewSeller with Duplicate MobileNumber which belongs to ternimated SellerId
    [Documentation]  Valid : To check Mobile number is entered duplicate (duplicate mobile number should belong to Seller status = terminated ) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${mobile}=  Randome_MobileNumber
    ${sellerid}=  RegisterSeller MobileNo   ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${mobile}  ${0}  000  Success
    UpdateSeller to convert  ${TokenEscrow}  @{escrowCompId}[0]  ${sellerid}  ${4}
    RegisterSeller MobileNo   ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${mobile}  ${0}  000  Success

TC_49 RegisterNewSeller with Empty Gender
    [Documentation]  Empty: To Verify response if gender paramter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Genter  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  ${0}  000  Success

TC_50 RegisterNewSeller with Invalid Gender
    [Documentation]  Invalid: To Verify response if gender paramter is  entered invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    RegisterSeller with Genter  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${mobileNo}  X  ${0}  R01  Validation failed

TC_51 RegisterNewSeller with Valid Gender
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Genter  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  M  ${0}  000  Success

TC_52 RegisterNewSeller with titleEn
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with titleEn   ${TokenEscrow}  @{escrowCompId}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  MR  ${0}  000  Success

TC_53 RegisterNewSeller with Empty titleEn
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Empty titleEn  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  M  ${0}  000  Success

TC_54 RegisterNewSeller with titleEn size 6
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with titleEn size 6  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{titleEn}[0]  ${0}  E11  Data length is over limit

TC_55 RegisterNewSeller with firstNameEn
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with firstNameEn  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${firstNameEnlast}[0]  ${0}  000  Success

TC_56 RegisterNewSeller with Empty firstNameEn
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Empty firstNameEn   ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  M  ${0}  000  Success

TC_57 RegisterNewSeller with firstNameEn size 101
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with inavalid firstNameEn size 101  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit

TC_58 RegisterNewSeller with lastNameEn
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with lastNameEgn  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${firstNameEnlast}[0]  ${0}  000  Success

TC_59 RegisterNewSeller with Empty lastNameEn
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Empty lastNameEn  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  M  ${0}  000  Success

TC_60 RegisterNewSeller with lastNameEn size 101
    [Documentation]  Valid: To Verify response if gender paramter is  entered valid and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with inavalid lastNameEn size 101  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit

TC_61 RegisterNewSeller with Valid LocalTitle
    [Documentation]  Valid: To Verify response if titleLocal is entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Title  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  นาย  ${0}  000  Success

TC_62 RegisterNewSeller with Empty LocalTitle
    [Documentation]  Empty: To Verify response if titleLocal paramter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Title  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  ${0}  000  Success

TC_63 RegisterNewSeller with LocalTitle more than 50 char
    [Documentation]  Invalid: To Verify response if titleLocal paramter is  entered more than size 50 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Title  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  นายนายนายนายนายนายนายนายนายนายนายนายนายนายนายายนายนายนายนาย  ${0}  E11  Data length is over limit

#TC_64 RegisterNewSeller with valid LocalFirstName and Kyc=1
#    [Documentation]  Valid : To Verify response if we enter valid firstNameLocal and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${IdNumber}=  Randome_IDNumber
#    RegisterSeller with FirstName @kyc=1  ${TokenEscrow}  @{escrowCompId}  ${1}  ${IdNumber}  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{RegisterSellerData}[7]  ${1}  000  Success

TC_65 RegisterNewSeller with Valid LocalFirstName and kyc=0
    [Documentation]  Valid : To Verify response if we enter valid firstNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with FirstName  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  สมชาย  ${0}  000  Success

TC_66 RegisterNewSeller with Empty LocalFirstName and Kyc=1
    [Documentation]  Empty: To Verify response if we NOT enter firstNameLocal and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with FirstName  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  ${1}  E05  Missing mandatory field

TC_67 RegisterNewSeller with Empty LocalFirstName for Kyc=0
    [Documentation]  Empty: To Verify response if we NOT enter firstNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with FirstName  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  ${0}  000  Success

TC_68 RegisterNewSeller with LocalFirstName more than 50 char and Kyc=0
    [Documentation]  Invalid: To Verify response if firstNameLocal paramter is  entered more than size 100 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with FirstName  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  สมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชาย  ${0}  E11  Data length is over limit

TC_69 RegisterNewSeller with Valid LocalLastName and Kyc=1
    [Documentation]  Valid : To Verify response if we enter valid lastNameLocal and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller with Valid LastName @Kyc=1  ${TokenEscrow}  @{type_id_others}[0]  ${1}  ${Id}  @{type_id_others}[1]  @{type_id_others}[2]  @{type_id_others}[3]  @{type_id_others}[4]  ${1}  R01  Validation failed

TC_70 RegisterNewSeller with Valid LocalLastname and Kyc=0
    [Documentation]  Valid : To Verify response if we enter valid lastNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with LastName  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  กิจการ  ${0}  000  Success

TC_71 RegisterNewSeller NOT enter lastNameLocal and request Kyc=1
    [Documentation]  Empty: To Verify response if we NOT enter lastNameLocal and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSellerNOT enter lastNameLocal  ${TokenEscrow}  @{not_lastnm_kyc1}[0]  @{not_lastnm_kyc1}[1]  ${EMPTY}  @{not_lastnm_kyc1}[2]  @{not_lastnm_kyc1}[3]  ${Id}  ${1}  ${1}  E05  Missing mandatory field

TC_72 RegisterNewSeller with Empty lastNameEn
    [Documentation]  Empty: To Verify response if we NOT enter lastNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with Empty lastName  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  ${0}  000  Success

TC_73 RegisterNewSeller with lastNameEn size 150
    [Documentation]  Invalid: To Verify response if lastNameLocal paramter is  entered more than size 150 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with inavalid lastNameEn size 101  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit

#TC_74 RegisterNewSeller valid dateOfBirth and request Kyc=1
#    [Documentation]  Valid : To Verify response if we enter valid dateOfBirth and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${Id}=  Randome_IDNumber
#    RegisterSeller enter lastNameLocal  ${TokenEscrow}  @{not_lastnm_kyc1}[0]  @{not_lastnm_kyc1}[1]  @{not_lastnm_kyc1}[2]  @{not_lastnm_kyc1}[3]  @{not_lastnm_kyc1}[4]  ${Id}  ${1}  ${1}  000  Success

TC_75 RegisterNewSeller with valid dateOfBirth KYCRequest=0
    [Documentation]  Valid : To Verify response if we enter valid dateOfBirth and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller withvalid dateOfBirth  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{dateOfBirth}[0]  ${0}  000  Success

TC_76 RegisterNewSeller Empty dateOfBirth and request Kyc=1
    [Documentation]  Empty: To Verify response if we NOT enter dateOfBirth and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Randome_IDNumber
    RegisterSeller Empty dateOfBirth kyc 1  ${TokenEscrow}  @{not_lastnm_kyc1}[0]  @{not_lastnm_kyc1}[1]  @{not_lastnm_kyc1}[2]  ${EMPTY}  @{not_lastnm_kyc1}[4]  ${Id}  ${1}  ${1}  E05  Missing mandatory field

TC_77 RegisterNewSeller with Empty dateOfBirth KYCRequest=0
    [Documentation]  Empty: To Verify response if we NOT enter dateOfBirth and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller Empty dateOfBirth kyc 0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  ${EMPTY}  @{not_lastnm_kyc1}[2]  ${0}  000  Success

TC_78 RegisterNewSeller with Invalid dateOfBirth KYCRequest=0
    [Documentation]  Invalid : To Verify response if we enter invalid dateOfBirth and request is sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller withvalid dateOfBirth  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{Invalid_dateOfBirth}  ${0}  E11  Data length is over limit

TC_79 RegisterNewSeller nationalityId paramter is not entered
    [Documentation]  Empty: To Verify response if nationalityId paramter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller Empty nationalityId kyc 0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{not_lastnm_kyc1}[2]  ${EMPTY}  ${0}  000  Success

TC_80 RegisterNewSeller Invalid nationalityId paramter
    [Documentation]  Invalid: To Verify response if nationalityId paramter is  entered invalid and request sent with all mandatory fields(Use numeric code of ISO 3166)
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller Invalid nationalityId kyc 0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{nationalityId}[0]  ${0}  R01  Validation failed

TC_81 RegisterNewSeller valid nationalityId paramter
    [Documentation]  Valid: To Verify response if nationalityId paramter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller valid nationalityId kyc 0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{v_nationalityId}[0]  ${0}  000  Success

TC_82 RegisterNewSeller INvalid nationalityId paramter
    [Documentation]  Invalid: To Verify response if nationalityId paramter is  entered  as Number value only and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller Invalid nationalityId kyc 0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{nationalityId}[0]  ${0}  R01  Validation failed

TC_83 RegisterNewSeller nationalityId paramter length more than 3
    [Documentation]  Invalid: To Verify response if nationalityId paramter is  entered more than size 3 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller Invalid nationalityId kyc 0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{nationalityId_more_3}[0]  ${0}  E11  Data length is over limit

#TC_84 RegisterNewSeller with Valid OtherVerification and Kyc=1
#    [Documentation]  Valid : To Verify response if we enter valid otherVerification and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    RegisterSeller with OtherVerification kyc1  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${1}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  @{IDno_enter_kyc_1}[4]  ${1}  000  Success

TC_85 RegisterNewSeller with Valid OtherVerification and Kyc=0
    [Documentation]  Valid : To Verify response if we enter valid otherVerificationand request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with OtherVerification kyc0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{IDno_enter_kyc_1}[4]  ${0}  000  Success

TC_86 RegisterNewSeller with Empty OtherVerification and Kyc=1
    [Documentation]  Empty: To Verify response if we NOT enter otherVerification and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller with OtherVerification kyc1  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${1}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${EMPTY}  ${1}  E05  Missing mandatory field

TC_87 RegisterNewSeller with Empty OtherVerification and Kyc=0
    [Documentation]  Empty: To Verify response if we NOT enter otherVerification and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with OtherVerification kyc0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  @{IDno_enter_kyc_1}[4]  ${0}  000  Success

TC_88 RegisterNewSeller with OtherVerification more then 15char and Kyc=0
    [Documentation]  Invalid: To Verify response if otherVerification  paramter is  entered more than size 15 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    RegisterSeller with OtherVerification kyc0  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  @{Escrow_Valid_MobileNo}[1]  ${MobNo}  SM88392083672835188  ${0}  E11  Data length is over limit

TC_89 RegisterNewSeller with Valid Workplace
    [Documentation]  Valid: To Verify response if workPlace is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller with WorkPlace  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${idNum}  ${1}  PavanTest  ${0}  000  Success

TC_90 RegisterNewSeller with Empty Workplace
    [Documentation]  Empty: To Verify response if workPlace parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller with WorkPlace  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${idNum}  ${1}  ${EMPTY}  ${0}  000  Success

TC_91 RegisterNewSeller with InValid Workplace
    [Documentation]  Invalid: To Verify response if workPlace paramter is  entered more than size 100 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${email}=  Randome_EmailId
    RegisterSeller with INvalid WorkPlace  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${idNum}  ${1}  @{work_space}  ${email}  ${0}  E11  Data length is over limit

TC_92 RegisterNewSeller with Valid userDefine
    [Documentation]  Valid: To Verify response if userDefine1-5 parameter is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    RegisterSeller with userdefine  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${email}  @{userDefine}[0]123  @{userDefine}[1]432  @{userDefine}[2]123  @{userDefine}[3]987  @{userDefine}[4]567  ${0}  000  Success

TC_93 RegisterNewSeller with Empty userDefine
    [Documentation]  Empty: To Verify response  if userDefine1-5 parameter is entered empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    RegisterSeller with userdefine  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${email}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${0}  000  Success

TC_94 RegisterNewSeller with InValid userDefine
    [Documentation]  Invalid: To Verify response if  userDefine1-5 parameter is entered invalid (more than size 100)  and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${email2}=  Randome_EmailId
    RegisterSeller with userdefine  ${TokenEscrow}  @{Escrow_Valid_MobileNo}[0]  ${email2}  @{firstNameEn1_lastnm}[0]  @{firstNameEn1_lastnm}[0]  @{firstNameEn1_lastnm}[0]  @{firstNameEn1_lastnm}[0]  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit

TC_95 RegisterSeller No KYC
    [Documentation]  Valid : To check idNumber is entered duplicate and request is send with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller Empty Kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${idNum}  ${1}  ${EMPTY}  E05  Missing mandatory field

TC_96 RegisterSeller Invalid KYC
    [Documentation]  Invalid : To verify response when kycRequest parameter is entered invalid and request is sent with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller duplicateIdNumber @post  ${TokenEscrow}  @{escrowCompId}[0]  ${idNum}  ${1}  ${7}  E03  Invalid request

TC_97 RegisterSeller Invalid KYC
    [Documentation]  Invalid : To verify response when kycRequest parameter is entered more than size 1
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${email2}=  Randome_EmailId
    RegisterSeller with KYC MORE THAN 1  ${TokenEscrow}  @{escrowCompId}[0]  ${email2}  ${23}  E03  Invalid request

TC_98 RegisterSeller with Empty Address
    [Documentation]  Empty: To Verify response if All address{} parameter is entered Empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    RegisterSeller with EMPTY ADDress  ${TokenEscrow}  @{escrowCompId}[0]  ${email}   ${0}  000   Success

TC_99 RegisterSeller with Valid Address
    [Documentation]  Valid: To Verify response if All address{} parameter is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    ${UserAddress}  Create Dictionary  homeAddress1=@{Address}[0]  homeAddress2=@{Address}[1]  countryId=@{Address}[2]  stateId=@{Address}[3]  state=@{Address}[4]  postalCode=@{Address}[5]  addressDefine1=@{Address}[6]  addressDefine2=@{Address}[7]  addressDefine3=@{Address}[8]  addressDefine4=@{Address}[9]
    RegisterSeller with ADDress  ${TokenEscrow}  @{escrowCompId}[0]  ${email}  ${UserAddress}  ${0}  000   Success

TC_100 RegisterSeller with Empty MailingAddress
    [Documentation]  Empty: To Verify response if All mailingAddress{} parameter is entered Empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    RegisterSeller with EMPTY ADDress  ${TokenEscrow}  @{escrowCompId}[0]  ${email}   ${0}  000   Success

TC_101 RegisterSeller with valid MailingAddress
    [Documentation]  Valid: To Verify response if All mailingAddress{} parameter is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    ${MailAddress}   Create Dictionary  mailAddress1=@{MailingAddress}[0]  mailAddress2=@{MailingAddress}[1]  countryId=@{Address}[2]  stateId=@{MailingAddress}[2]  state=@{Address}[4]  postalCode=@{MailingAddress}[3]  addressDefine1=@{Address}[6]  addressDefine2=@{Address}[7]  addressDefine3=@{Address}[8]  addressDefine4=@{Address}[9]
    RegisterSeller with MailingAddress  ${TokenEscrow}  @{escrowCompId}[0]  ${email}  ${MailAddress}  ${0}  000   Success

TC_102 RegisterSeller verify response SellerId
    [Documentation]  Valid: To Verify format of sellerId in API response of Register Seller API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${email}=  Randome_EmailId
    RegisterSeller Verify SellerId  ${TokenEscrow}  @{escrowCompId}[0]  ${email}  ${0}  000   Success

TC_103 RegisterSeller IdNumber without checksum and Kyc=1
    [Documentation]  InValid: To verify response If idNumber is entered invalid( with out check sum validation) and request sent with all mandatory fields (KycRequest=1)
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller with Invalid IdNumber @kyc=1  ${TokenEscrow}  @{escrowCompId}[0]  ${1}  ${idNum}  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{RegisterSellerData}[7]  ${1}  R01  Validation failed

TC_104 RegisterSeller with Invalid OtherVerification and kyc=1
    [Documentation]  InValid: To verify response If otherVerification is entered invalid and request sent with all mandatory fields (KycRequest=1)
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller with Invalid OtherVerification @kyc=1  ${TokenEscrow}  @{escrowCompId}[0]  ${1}  ${idNum}  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{RegisterSellerData}[7]  ${1}  R01  Validation failed

TC_105 RegisterSeller with Invalid IdNumber and Kyc=1
    [Documentation]  Invalid: To check API reponse when IdNumber is enter invalid and request is sent with all mandatory fields (KycRequest=1)
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    RegisterSeller with Invalid IdNumber @kyc=1  ${TokenEscrow}  @{escrowCompId}[0]  ${1}  ${idNum}  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{RegisterSellerData}[7]  ${1}  R01  Validation failed






