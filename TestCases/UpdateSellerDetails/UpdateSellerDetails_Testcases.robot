*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Get Token.robot
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/UpdateSellerDetails_API.robot
Resource    ../../Resource/Keyword/UpdateSeller_Status_API.robot
Resource    ../../Resource/Keyword/GetSellerDetails_API.robot
Resource    ../../Resource/Variable/user data.robot

*** Test Cases ***
TC_06 UpdateSellerDetails request parameter of Update
    [Documentation]  Valid: To Verify request parameters of Register Seller API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_07 Request Update Seller Details API
    [Documentation]  Valid: To Verify response  parameter of Update Seller Detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_08 Empty body
    [Documentation]  Empty : To verify Response when all request fields are entered empty without body
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_Empty_kyc  ${TokenEscrow}  ${EMPTY}  ${EMPTY}  ${EMPTY}  E05  Missing mandatory field


TC_09 Empty body Update Seller Details API
    [Documentation]   Empty : To verify Response when request is send with mandatory fields and other fields are send as "".
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${EMPTY}  ${0}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_10 Seller_Details_API Empty EscrowCompId
    [Documentation]  Empty : To check API response when escrowCompanyId parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  ${EMPTY}  ${SellerId}  ${0}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_11 Seller_Details_API Valid EscrowCompId
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    SET GLOBAL VARIABLE  ${Idno_dup}  ${idnumber}
    SET GLOBAL VARIABLE  ${SellerId000}  ${SellerId}
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_12 Seller_Details_API Invalid EscrowCompId
    [Documentation]  Invalid: To check API response when escrowCompanyId parameter is entered Invalid and request is sent with mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId_Invalid}[0]  ${SellerId}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_13 Seller_Details_API Length more 3 EscrowCompId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompanyID_exeed_length}[0]  ${SellerId}  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_14 Seller_Details_API Length less 3 EscrowCompId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{EScrow_id_less_th3}[0]  ${SellerId}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_15 Selle_Details_API Empty SellerId
    [Documentation]  Empty : To check API response when sellerId parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${EMPTY}  ${0}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_16 Selle_Details_API Invalid SellerId
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields (seller Id not existing in company)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_17 Selle_Details_API SellerId More than 36
    [Documentation]  Invalid : To verify response when sellerId  parameter is entered more than size 36
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}12  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_18 Selle_Details_API Duplicate Idno
    [Documentation]  Invalid: To Verify response if idNumber parameter is  entered more than size 30 and request is sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  35   [NUMBERS]
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${Id}  ${3}  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_19 Selle_Details_API Duplicate Idno TypeId 3
    [Documentation]  Duplicate: To check idNumber is entered duplicate (duplicate id number should belong to Seller status = Active) and request is send with all mandatory fields
    [Tags]  U01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Id23}=  RegisterSellerID
    SET GLOBAL VARIABLE  ${SellerId1}  ${SellerId}
    ${SellerId23}  ${IdNum23}=  RegisterSellerID
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId23}  ${Id23}  ${3}  ${0}  U01  Duplicate ID card, email or mobile no.
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_20 Selle_Details_API Duplicate Idno TypeId 1
    [Documentation]  Duplicate: To check idNumber is entered duplicate with own user (duplicate id number should belong to Seller status = Active) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Id23}=  RegisterSellerID
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${Id23}  ${1}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_21 Selle_Details_API Duplicate Idno Status 4
    [Documentation]  Duplicate: To check idNumber is entered duplicate (duplicate id number should belong to Seller status = terminated ) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Idnum}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId000}  ${4}
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idno_dup}  ${3}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_22 Selle_Details_API Valid Email
    [Documentation]  Duplicate: To check idNumber is entered duplicate with own user (duplicate id number should belong to Seller status = terminated) and request is send with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSellerDetails Email TypeId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idnumber}  ${email}  ${1}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_23 Selle_Details_API Empty Idno
    [Documentation]  Empty: To Verify response if idNumber parameter is  NOT entered and KYCRequest’ = 1 and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_24 Selle_Details_API Empty Idno Kyc 0
    [Documentation]  Empty: To Verify response if idNumber parameter is  NOT entered and KYCRequest’ = 0 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails KYC 0  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_25 Selle_Details_API Valid Idno
    [Documentation]   Valid: To Verify response if idNumber parameter is entered valid and KYCRequest’ = 0 and request sent with all mandatory fieldsndatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${3}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_26 Selle_Details_API Idno KYC 1 ->Testcase skipped
#    [Documentation]  Valid: To Verify response if idNumber parameter is entered valid and KYCRequest’ = 1 and request sent with all mandatory fields
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}
#
#
TC_27 Selle_Details_API Valid TypeOfId KYC 1 ->Testcase skipped
#    [Documentation]  Valid: To Verify response if we enter valid typeOfId and request is sent with all mandatory fields (KYCRequest’ = 1 and Valid Id parameter)
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    ${idNum}=  Randome_IDNumber
#    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${2}  ${1}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_28 Selle_Details_API TypeOfId Equal Citizen
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and kycRequest = 0 request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${1}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_29 Selle_Details_API TypeOfId equal passport
    [Documentation]  Valid: To Verify response when  typeOfId = Passport and kycRequest =0, request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${2}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_30 Selle_Details_API TypeOfId equal Others
    [Documentation]  Valid: To Verify response when  typeOfId = Others  and kycRequest = 0,  request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${3}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_31 Selle_Details_API Diff TypeOfId
    [Documentation]  Valid: To Verify response with duplicate "idNumber" but typeOfId is different from orignal, KYCRequest = 0 and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${1}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_32 Selle_Details_API TypeOfId equal citizen KYC 1 ->Testcase skipped
#    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and kycRequest = 1 request is sent with all mandatory fields
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_33 Selle_Details_API TypeOfId equal passport ->Testcase skipped
#    [Documentation]  Valid: To Verify response when  typeOfId = Passport and kycRequest =1, request is sent with all mandatory fields
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${2}  ${1}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}
#
TC_34 Selle_Details_API TypeOfId equal Others kyc 1 ->Testcase skipped
#    [Documentation]  Valid: To Verify response when  typeOfId = Others  and kycRequest = 1,  request is sent with all mandatory fields
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    ${emailid}=  Randome_EmailId
#    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${3}  ${1}  ${emailid}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_35 Selle_Details_API Invalid typeOfId
    [Documentation]  Invalid: To Verify response if we enter invalid typeOfId and request is sent with all mandatory fields (KYCRequest’ = 1 and Valid Id parameter)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${44}  ${1}  ${emailid}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_36 Selle_Details_API Empty typeOfId
    [Documentation]  Invalid: To Verify response if we enter invalid typeOfId and request is sent with all mandatory fields (KYCRequest’ = 1 and Valid Id parameter)
    [Tags]  E051
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails Empty TypeOfId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${EMPTY}  ${1}  ${emailid}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_37 Selle_Details_API mobilecountrycode empty
    [Documentation]  Valid : To Verify response if mobileCountryCode parameter is entered empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Empty MobileCountryCode  ${TokenEscrow}  @{escrowCompId}[0]  ${EMPTY}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_38 Selle_Details_API Valid mobile_country_code
    [Documentation]  Valid: To Verify response if mobileCountryCode parameter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${MobNo}=  Randome_MobileNumber
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_39 Selle_Details_API mobile no
    [Documentation]  Valid: To Verify response if mobileNo parameter is  entered valid without first digit 0 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${MobNo}=  Randome_MobileNumber
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_40 Selle_Details_API Empty mobile no
    [Documentation]  Empty: To Verify response if mobileNo parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${EMPTY}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_41 Selle_Details_API Empty mobilecountrycode
    [Documentation]  Empty: To Verify response if mobileNo parameter is entered and mobileCountryCode is NOT entered and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${MobNo}=  Randome_MobileNumber
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  ${EMPTY}  ${MobNo}  ${SellerId}  ${0}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_42 Selle_Details_API Valid mobile no
    [Documentation]  Valid: To Verify response if mobileNo parameter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    SET GLOBAL VARIABLE  ${SellerIdno1}  ${SellerId}
    ${MobNo}=  Randome_MobileNumber
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_43 Selle_Details_API Duplicate mobile no Status 1
    [Documentation]  Duplicate: To check Mobile number is entered duplicate (duplicate mobile number should belong to Seller status = Active) and request is send with all mandatory fields
    [Tags]  U01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${MobNo1}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId1}   mobileNo
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo1}  ${SellerId}  ${0}  U01  Duplicate ID card, email or mobile no.
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_44 Selle_Details_API Duplicate mobile no Status 4
    [Documentation]  Duplicate : To check Mobile number is entered duplicate (duplicate mobile number should belong to Seller status = terminated ) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Idnum}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerIdno1}  ${4}
    ${MobNo1}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerIdno1}   mobileNo
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo1}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_45 Selle_Details_API Duplicate mobile no Status 1
    [Documentation]  Duplicate: To check Mobile number is entered duplicate with own user (duplicate mobile number should belong to Seller status = Active) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Idnum}=  RegisterSellerID
    ${MobNo1}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   mobileNo
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo1}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_46 Selle_Details_API Duplicate mobile no Status 4
    [Documentation]  Duplicate : To check Mobile number is entered duplicate (duplicate mobile number should belong to Seller status = terminated ) and request is send with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Idnum}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    ${MobNo_dup}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   mobileNo
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo_dup}  ${SellerId}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_47 Selle_Details_API Empty Email
    [Documentation]  Valid: To Verify response if email parameter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Email  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_48 Selle_Details_API Invalid Email
    [Documentation]  Invalid: To Verify response if email parameter is  entered invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_Number
    UpdateSellerDetails Email  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  pavan${emailid}  ${0}  R01  Validation failed
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_49 Selle_Details_API Valid Email
    [Documentation]  Valid: To Verify response if email parameter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    SET GLOBAL VARIABLE  ${email}  ${emailid}
    UpdateSellerDetails Email  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${email}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_50 Selle_Details_API Duplicate Email Status 1
    [Documentation]  Duplicate: To check Email Address is entered duplicate (duplicate Email Address should belong to Seller status = Active)and request is send with all mandatory fields
    [Tags]  U01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${Email}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId1}   email
    UpdateSellerDetails Email  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Email}  ${0}  U01  Duplicate ID card, email or mobile no.
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_51 Selle_Details_API Duplicate Email Status 4
    [Documentation]  Duplicate: To check Email Address is entered duplicate (duplicate Email Address should belong to Seller status = terminated )and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${Email}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerIdno1}   email
    UpdateSellerDetails Email  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Email}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_52 Selle_Details_API Duplicate Email Status 1
    [Documentation]  Duplicate: To check Email Address is entered duplicate (duplicate Email Address should belong to Seller status = terminated )and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}
    UpdateSellerDetails Email TypeId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${email}  ${1}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_53 Selle_Details_API Duplicate Email Status 4
    [Documentation]  Duplicate: To check Email Address is entered duplicate (duplicate Email Address should belong to Seller status = terminated )and request is send with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    ${Email}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   email
    UpdateSellerDetails Email TypeId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${Email}  ${1}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_54 Selle_Details_API Empty Gender
    [Documentation]  Empty: To Verify response if gender parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Gender  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_55 Selle_Details_API Invalid Gender
    [Documentation]  Invalid: To Verify response if gender parameter is  entered invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Gender  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  Y  ${0}  R01  Validation failed
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_56 Selle_Details_API Valid Gender
    [Documentation]  Valid: To Verify response if gender parameter is  entered valid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Gender  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  M  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_57 Selle_Details_API Valid titleEn
    [Documentation]  Valid: To Verify response if titleEn is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails titleEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  Mr  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_58 Selle_Details_API Empty titleEn
    [Documentation]  Empty: To Verify response if titleEn parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails titleEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_59 Selle_Details_API Invalid titleEn
    [Documentation]  Invalid: To Verify response if titleEn parameter is  entered more than size 5 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails titleEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  Mr.3467  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_60 Selle_Details_API Valid firstNameEn
    [Documentation]  Valid: To Verify response if titleEn is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails firstNameEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameEn}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_61 Selle_Details_API Empty firstNameEn
    [Documentation]  Empty: To Verify response if titleEn parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails firstNameEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_62 Selle_Details_API Invalid firstNameEn
    [Documentation]  Invalid: To Verify response if titleEn parameter is  entered more than size 5 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails firstNameEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameEn1_lastnm}  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_63 Selle_Details_API Valid lastNameEn
    [Documentation]  Valid: To Verify response if titleEn is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails lastNameEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameEn}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_64 Selle_Details_API Empty lastNameEn
    [Documentation]  Empty: To Verify response if titleEn parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails lastNameEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_65 Selle_Details_API Invalid lastNameEn
    [Documentation]  Invalid: To Verify response if lastNameEn parameter is  entered more than size 100 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails lastNameEn  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_66 Selle_Details_API Valid titleLocal
    [Documentation]  Valid: To Verify response if titleEn is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails titleLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  TH  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_67 Selle_Details_API Empty titleLocal
    [Documentation]  Empty: To Verify response if titleEn parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails titleLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_68 Selle_Details_API Invalid titleLocal
    [Documentation]  Invalid: To Verify response if titleEn parameter is  entered more than size 5 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails titleLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{titleLocal_more_50}  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_69 Selle_Details_API valid firstNameLocal ->Testcase skipped
#    [Documentation]  Valid : To Verify response if we enter valid firstNameLocal and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    ${emailid}=  Randome_EmailId
#    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  ${emailid}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_70 Selle_Details_API Valid firstNameLocal
    [Documentation]  Valid : To Verify response if we enter valid firstNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails firstNameLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameLocal}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_71 Selle_Details_API valid firstNameLocal
    [Documentation]  Empty: To Verify response if we NOT enter firstNameLocal and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  ${EMPTY}  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  ${emailid}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_72 Selle_Details_API EMPTY firstNameLocal
    [Documentation]  Valid : To Verify response if we enter valid firstNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails firstNameLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_73 Selle_Details_API Invalid firstNameLocal
    [Documentation]  Invalid: To Verify response if firstNameLocal parameter is  entered more than size 100 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails firstNameLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_74 Selle_Details_API valid lastNameLocal ->Testcase skipped
#    [Documentation]  Valid : To Verify response if we enter valid lastNameLocal and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    ${emailid}=  Randome_EmailId
#    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  ${emailid}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_75 Selle_Details_API Valid lastNameLocal
    [Documentation]  Valid : To Verify response if we enter valid lastNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails lastNameLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{LastNameLocal}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_76 Selle_Details_API EMPTY lastNameLocal
    [Documentation]  Empty: To Verify response if we NOT enter lastNameLocal and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  ${EMPTY}  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  ${emailid}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_77 Selle_Details_API Empty lastNameLocal
    [Documentation]  Empty: To Verify response if we NOT enter lastNameLocal and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails lastNameLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_78 Selle_Details_API InValid lastNameLocal
    [Documentation]  Invalid: To Verify response if lastNameLocal parameter is  entered more than size 150 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails lastNameLocal  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{firstNameEn1_lastnm}[0]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_79 Selle_Details_API valid Dateofbirth kyc 1 ->Testcase skipped
#    [Documentation]  Valid : To Verify response if we enter valid dateOfBirth and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    ${emailid}=  Randome_EmailId
#    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  ${emailid}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_80 Selle_Details_API Valid Dateofbirth
    [Documentation]  Valid : To Verify response if we enter valid dateOfBirth and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails DateofBirth  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{dateOfBirth}[0]  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_81 Selle_Details_API Empty Dateofbirth kyc 1
    [Documentation]  Empty: To Verify response if we NOT enter dateOfBirth and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails DateofBirth  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${EMPTY}  ${1}  ${1}  ${emailid}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_82 Selle_Details_API Valid Dateofbirth
    [Documentation]  Empty: To Verify response if we NOT enter dateOfBirth and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails DateofBirth  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_83 Selle_Details_API InValid Dateofbirth
    [Documentation]  Empty: To Verify response if we NOT enter dateOfBirth and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  E04
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails DateofBirth  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{IN_dateOfBirth}[0]  ${0}  E04  Invalid date/time format
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_84 Selle_Details_API Empty nationalityId
    [Documentation]  Empty: To Verify response if nationalityId parameter is not entered and request sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails nationalityId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_85 Selle_Details_API InValid nationalityId
    [Documentation]  Invalid: To Verify response if nationalityId parameter is  entered invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails nationalityId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  aaa  ${0}  R01  Validation failed
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_86 Selle_Details_API Valid nationalityId
    [Documentation]  Valid: To Verify response if nationalityId parameter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails nationalityId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{v_nationalityId}[0]  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_87 Selle_Details_API InValid nationalityId
    [Documentation]  Invalid: To Verify response if nationalityId parameter is  entered more than size 3 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails nationalityId  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{nationalityId_more_3}[0]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_88 Selle_Details_API valid otherverification kyc 1 ->Testcase skipped
#    [Documentation]  Valid : To Verify response if we enter valid otherVerification and request is sent with all mandatory fields with KYCRequest=1
#    [Tags]  000
#    ${TokenEscrow}=  GetToken Escrow
#    ${idNum}=  Randome_IDNumber
#    ${SellerId}  ${idnumber}=  RegisterSellerID
#    ${emailid}=  Randome_EmailId
#    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  ${emailid}  000  Success
#    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_89 Selle_Details_API Valid otherVerification
    [Documentation]  Valid : To Verify response if we enter valid otherVerification and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails otherVerification  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{type_id_others}[4]  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_90 Selle_Details_API Empty otherverification kyc 1
    [Documentation]  Empty: To Verify response if we NOT enter otherVerification and request is sent with all mandatory fields with KYCRequest=1
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails Valid data  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${EMPTY}  ${1}  ${1}  ${emailid}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_91 Selle_Details_API Empty otherVerification
    [Documentation]  Empty: To Verify response if we NOT enter otherVerification and request is sent with all mandatory fields with KYCRequest=0
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails otherVerification  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_92 Selle_Details_API InValid otherVerification
    [Documentation]  Invalid: To Verify response if otherVerification  parameter is  entered more than size 15 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails otherVerification  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{type_id_others}[5]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_93 Seller_Details_API Valid workPlace
    [Documentation]  Valid: To Verify response if workPlace is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails workPlace  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${workPlace}[0]  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_94 Seller_Details_API Empty workPlace
    [Documentation]  Empty: To Verify response if workPlace parameter is not entered and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails workPlace  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_95 Seller_Details_API InValid workPlace
    [Documentation]  Invalid: To Verify response if workPlace parameter is  entered more than size 100 and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails workPlace  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${work_space}[0]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_96 Seller_Details_API Valid workPlace
    [Documentation]  Valid: To Verify response if userDefine1-5 parameter is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails userDefine  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{userDefine}[0]  @{userDefine}[1]  @{userDefine}[2]  @{userDefine}[3]  @{userDefine}[4]  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_97 Seller_Details_API Empty workPlace
    [Documentation]  Empty: To Verify response  if userDefine1-5 parameter is entered empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails userDefine  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_98 Seller_Details_API InValid workPlace
    [Documentation]  Invalid: To Verify response if userDefine1-5 parameter is entered invalid (more than size 100)  and request sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails userDefine  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  @{In_User_Def}[0]  @{In_User_Def}[0]  @{In_User_Def}[0]  @{In_User_Def}[0]  @{In_User_Def}[0]  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_99 UpdateSellerDetails with Empty Kyc and Mandetory Data
    [Documentation]  Empty : To verify response when kycRequest parameter is not entered and request is sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_Empty_kyc   ${TokenEscrow}   @{escrowCompId}[0]  ${SellerId}   ${EMPTY}   E05   Missing mandatory field

TC_100 UpdateSellerDetails with Invalid Kyc and Mandetory Data
    [Documentation]  Invalid : To verify response when kycRequest parameter is entered invalid and request is sent with all mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc   ${TokenEscrow}   @{escrowCompId}[0]  ${SellerId}   ${3}   E03   Invalid request

TC_101 UpdateSellerDetails with Valid Kyc and Mandetory Data
    [Documentation]  Valid: To verify response when kycRequest parameter is entered valid and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails_kyc   ${TokenEscrow}   @{escrowCompId}[0]  ${SellerId}   ${0}   000   Success

TC_102 UpdateSellerDetails with Empty Address
    [Documentation]  Empty: To Verify response if All address{} parameter is entered Empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Address   ${TokenEscrow}   @{escrowCompId}[0]   ${SellerId}   ${0}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   000   Success

TC_103 UpdateSellerDetails with Invalid CountryId
    [Documentation]  Empty: To Verify response if address.countryId parameter is entered Invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Address   ${TokenEscrow}   @{escrowCompId}[0]   ${SellerId}   ${0}   @{MailingAddress}[0]   @{MailingAddress}[1]   999   @{MailingAddress}[2]   @{Address}[4]   @{MailingAddress}[3]   @{Address}[6]   @{Address}[7]   @{Address}[8]   @{Address}[9]   R01   Validation failed

TC_104 UpdateSellerDetails with Valid Address
    [Documentation]  Valid: To Verify response if All address{} parameter is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails Address   ${TokenEscrow}   @{escrowCompId}[0]   ${SellerId}   ${0}   @{MailingAddress}[0]   @{MailingAddress}[1]   @{Address}[2]   @{MailingAddress}[2]   @{Address}[4]   @{MailingAddress}[3]   @{Address}[6]   @{Address}[7]   @{Address}[8]   @{Address}[9]   000   Success

TC_105 UpdateSellerDetails with Empty MailingAddress
    [Documentation]  Empty: To Verify response if All mailingAddress{} parameter is entered Empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails MailingAddress  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}   ${0}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   ${EMPTY}   000   Success

TC_106 UpdateSellerDetails with Invalid CountryId
    [Documentation]  Empty: To Verify response if mailingAddress.countryId parameter is entered Invalid and request sent with all mandatory fields
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails MailingAddress  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}   ${0}   @{MailingAddress}[0]   @{MailingAddress}[1]   999   @{MailingAddress}[2]   @{Address}[4]   @{MailingAddress}[3]   @{Address}[6]   @{Address}[7]   @{Address}[8]   @{Address}[9]   R01   Validation failed

TC_107 UpdateSellerDetails with Valid MailingAddress
    [Documentation]  Valid: To Verify response if All mailingAddress{} parameter is entered valid  and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSellerDetails MailingAddress  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}   ${0}   @{MailingAddress}[0]   @{MailingAddress}[1]   @{Address}[2]   @{MailingAddress}[2]   @{Address}[4]   @{MailingAddress}[3]   @{Address}[6]   @{Address}[7]   @{Address}[8]   @{Address}[9]   000   Success

TC_108 UpdateSellerDetails Update to Kyc=1 -> TestCase Skipped
    [Documentation]  Valid: To check API response when register "kycRequest": 0 but update seller detail "kycRequest": 1

TC_109 UpdateSellerDetails with registered Kyc=1 -> TestCase Skipped
    [Documentation]  Valid: To check API response when register "kycRequest": 1 but update update seller detail "kycRequest": 0

TC_110 UpdateSellerDetails with IdNumber is Invalid
    [Documentation]  Invalid:To check API response when idNumber is enter invalid( with out check sum validation) and request is sent with all mandatory fields (KycRequest=1)
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    ${Invalid_IdNum}=  Generate Random String  10  [NUMBERS]
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${Invalid_IdNum}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{Kyc1_Data}[1]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${1}  R01  Validation failed

TC_111 UpdateSellerDetails with OtherVarification is Invalid
    [Documentation]  Invalid : To check API response when otherVerification is entered invalid and request is sent with all mandatory fields (KycRequest=1)
    [Tags]  R01
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idnumber}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{Kyc1_Data}[1]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${1}  R01  Validation failed

TC_112 UpdateSellerDetails with IdNumber is Invalid
    [Documentation]  Invalid: To check API reponse when IdNumber is enter invalid and request is sent with all mandatory fields (KycRequest=1)
    [Tags]  R02
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  @{Kyc1_Data}[0]  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{Kyc1_Data}[1]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${1}  R02  ข้อมูลที่ใช้ในการตรวจสอบไม่ถูกต้อง

TC_113 UpdateSellerDetails with Active SellerId
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid and request is sent with mandatory fields(when Seller Status is Active)
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${1}
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idnumber}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_114 UpdateSellerDetails with Locked SellerId and All valid data
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid and request is sent with all valid fields(when Seller Status is Locked)
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${2}
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idnumber}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_115 UpdateSellerDetails with Suspended SellerId and All Valid Data
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid and request is sent with all valid fields(when Seller Status is Suspended)
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${3}
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idnumber}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  000  Success

TC_116 UpdateSellerDetails with Terminated SellerId and All Valid Data
    [Documentation]  Valid: To check API response when sellerId parameter is entered Valid and request is sent with all valid fields(when Seller Status is Terminated)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}  ${idnumber}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${idnumber}  ${3}  @{valid_mobile_country_code}[1]  ${MobNo}  ${emailid}  M  @{RegisterSellerData}[0]  @{RegisterSellerData}[1]  @{RegisterSellerData}[2]  @{RegisterSellerData}[3]  @{RegisterSellerData}[4]  @{RegisterSellerData}[5]  @{RegisterSellerData}[6]  @{v_nationalityId}  @{RegisterSellerData}[7]  @{RegisterSellerData}[8]  @{RegisterSellerData}[9]  @{RegisterSellerData}[10]  @{RegisterSellerData}[11]  @{RegisterSellerData}[12]  @{RegisterSellerData}[13]  ${0}  E03  Invalid request
