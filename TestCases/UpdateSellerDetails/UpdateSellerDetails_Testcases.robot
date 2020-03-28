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
    UpdateSellerDetails_Empty_kyc  ${TokenEscrow}  ${EMPTY}  ${EMPTY}  ${EMPTY}  E05  Missing mandatory field


TC_09 Empty body Update Seller Details API
    [Documentation]   Empty : To verify Response when request is send with mandatory fields and other fields are send as "".
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${MobNo}=  Randome_MobileNumber
    ${emailid}=  Randome_EmailId
    ${SellerId}=  RegisterSellerID
    UpdateSeller with valid Data  ${TokenEscrow}  @{valid_mobile_country_code}[0]  ${SellerId}  ${EMPTY}  ${0}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_10 Seller_Details_API Empty EscrowCompId
    [Documentation]  Empty : To check API response when escrowCompanyId parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  ${EMPTY}  ${SellerId}  ${0}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_11 Seller_Details_API Valid EscrowCompId
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_12 Seller_Details_API Invalid EscrowCompId
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId_Invalid}[0]  ${SellerId}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_13 Seller_Details_API Length more 3 EscrowCompId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompanyID_exeed_length}[0]  ${SellerId}  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_14 Seller_Details_API Length less 3 EscrowCompId
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{EScrow_id_less_th3}[0]  ${SellerId}  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_15 Selle_Details_API Empty SellerId
    [Documentation]  Empty : To check API response when sellerId parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${EMPTY}  ${0}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_16 Selle_Details_API Invalid SellerId
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields (seller Id not existing in company)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  @{Invalid_SellerID}[0]  ${0}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_17 Selle_Details_API SellerId More than 36
    [Documentation]  Invalid : To verify response when sellerId  parameter is entered more than size 36
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails_kyc  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}12  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_18 Selle_Details_API Duplicate idNum
    [Documentation]  Invalid: To Verify response if idNumber parameter is  entered more than size 30 and request is sent with all mandatory fields
    [Tags]  E11
    ${TokenEscrow}=  GetToken Escrow
    ${Id}=  Generate Random String  35   [NUMBERS]
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${Id}  ${3}  ${0}  E11  Data length is over limit
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_19 Selle_Details_API duplicate idNum
    [Documentation]  Duplicate: To check idNumber is entered duplicate (duplicate id number should belong to Seller status = Active) and request is send with all mandatory fields
    [Tags]  U01
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Id23}=  RegisterSellerID
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${Id23}  ${3}  ${0}  U01  Duplicate ID card, email or mobile no
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_20 Selle_Details_API duplicate idNum
    [Documentation]  Duplicate: To check idNumber is entered duplicate (duplicate id number should belong to Seller status = terminated ) and request is send with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${Idnum}=  RegisterSellerID
    UpdateSeller to convert    ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${4}
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${3}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_21 Selle_Details_API idNum
    [Documentation]  Empty: To Verify response if idNumber parameter is  NOT entered and KYCRequest’ = 1 and request sent with all mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  E05  Missing mandatory field
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_22 Selle_Details_API duplicate idNum
    [Documentation]  Empty: To Verify response if idNumber parameter is  NOT entered and KYCRequest’ = 0 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails KYC 0  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${EMPTY}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_23 Selle_Details_API duplicate idNum
    [Documentation]   Valid: To Verify response if idNumber parameter is entered valid and KYCRequest’ = 0 and request sent with all mandatory fieldsith all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${3}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_24 Selle_Details_API idNum
    [Documentation]  Valid: To Verify response if idNumber parameter is entered valid and KYCRequest’ = 1 and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}


TC_26 Selle_Details_API Valid TypeOfId
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and kycRequest = 0 request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${1}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_27 Selle_Details_API TypeOfId equal passport
    [Documentation]  Valid: To Verify response when  typeOfId = Passport and kycRequest =0, request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${2}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_28 Selle_Details_API TypeOfId equal Others
    [Documentation]  Valid: To Verify response when  typeOfId = Others  and kycRequest = 0,  request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${3}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_29 Selle_Details_API Diff TypeOfId
    [Documentation]  Valid: To Verify response with duplicate "idNumber" but typeOfId is different from orignal, KYCRequest = 0 and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    ${idNum}=  Randome_IDNumber
    UpdateSellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${Idnum}  ${1}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_30 Selle_Details_API TypeOfId equal citizen
    [Documentation]  Valid: To Verify response when  typeOfId = Citizen id and kycRequest = 1 request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${1}  ${1}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_31 Selle_Details_API TypeOfId equal passport
    [Documentation]  Valid: To Verify response when  typeOfId = Passport and kycRequest =1, request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails IDNUMBER KYC 1  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${2}  ${1}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_32 Selle_Details_API TypeOfId equal Others kyc 1
    [Documentation]  Valid: To Verify response when  typeOfId = Others  and kycRequest = 1,  request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails typeOfId equal to others  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${3}  ${1}  ${emailid}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_33 Selle_Details_API Invalid typeOfId
    [Documentation]  Invalid: To Verify response if we enter invalid typeOfId and request is sent with all mandatory fields (KYCRequest’ = 1 and Valid Id parameter)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails typeOfId equal to others  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${44}  ${1}  ${emailid}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_34 Selle_Details_API Empty typeOfId
    [Documentation]  Invalid: To Verify response if we enter invalid typeOfId and request is sent with all mandatory fields (KYCRequest’ = 1 and Valid Id parameter)
    [Tags]  E03
    ${TokenEscrow}=  GetToken Escrow
    ${idNum}=  Randome_IDNumber
    ${SellerId}=  RegisterSellerID
    ${emailid}=  Randome_EmailId
    UpdateSellerDetails typeOfId equal to others  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}  ${idNum}  @{IDno_enter_kyc_1}[1]  @{IDno_enter_kyc_1}[2]  @{IDno_enter_kyc_1}[3]  ${IDno_enter_kyc_1}[4]  ${EMPTY}  ${1}  ${emailid}  E03  Invalid request
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_35 Seller Details API mobile country code empty
    [Documentation]  Valid : To Verify response if mobileCountryCode parameter is entered empty and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    UpdateSellerDetails Empty MobileCountryCode  ${TokenEscrow}  @{escrowCompId}[0]  ${EMPTY}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}

TC_36 Seller Details API mobilecountrycode mobile
    [Documentation]  Valid: To Verify response if mobileCountryCode parameter is  entered valid and request sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}=  RegisterSellerID
    ${MobNo}=  Randome_MobileNumber
    UpdateSellerDetails MobileCountrycode mobile  ${TokenEscrow}  @{escrowCompId}[0]  @{valid_mobile_country_code}[1]  ${MobNo}  ${SellerId}  ${0}  000  Success
    VerifySellerDetails  ${TokenEscrow}  @{escrowCompId}[0]  ${SellerId}



