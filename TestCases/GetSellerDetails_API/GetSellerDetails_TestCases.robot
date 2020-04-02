*** Settings ***
Resource    ../../Resource/Keyword/Global Keyword/Register_Global_Keywords.robot
Resource    ../../Resource/Keyword/All Keywords EscrowAPI.robot
Resource    ../../Resource/Variable/user data.robot
Test Setup   Sleep  2s

*** Test Cases ***

TC_06 GetSellerDetails to Verify Request
    [Documentation]  Valid: To Verify request parameter of get Seller detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_07 GetSellerDetails To Verify Response
    [Documentation]  Valid: To Verify response  parameter of get Seller detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_08 GetSellerDetails with Empty Body
    [Documentation]  Invalid: To verify Response when all request fields are entered empty without body
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    GetSellerDetails  ${TokenEscrow}  ${EMPTY}  ${EMPTY}  E05  Missing mandatory field

TC_09 GetSellerDetails with Valid EscrowID and Mandatory Fields
    [Documentation]  Valid: To check API response when escrowCompanyId parameter is entered Valid and request is sent with mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_10 GetSellerDetails with all registered Data
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with all data
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success

TC_11 GetSellerDetails with Invalid EscrowCompanyID
    [Documentation]  Invalid: To check API response when escrowCompanyId parameter is entered Invalid and request is sent with mandatory fields
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  999  ${SellerId}  E08  Data not found

TC_12 GetSellerDetails with EscrowCompanyId more than 3 digit
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered more than size 3
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  9999  ${SellerId}  E08  Data not found

TC_13 GetSellerDetails with EscrowCompanyID less than 3 digit
    [Documentation]  Invalid : To verify response when escrowCompanyId parameter is entered less than size 3
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  99  ${SellerId}  E08  Data not found

TC_14 GetSellerDetails with Empty SellerID
    [Documentation]  Empty : To check API response when sellerId parameter is entered empty and request is sent with mandatory fields
    [Tags]  E05
    ${TokenEscrow}=  GetToken Escrow
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${EMPTY}  E05  Missing mandatory field

TC_15 GetSellerDetails with Invalid SellerId
    [Documentation]  Invalid: To check API response when sellerId parameter is entered Invalid and request is sent with mandatory fields  (seller Id not existing in company)
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}a  E08  Data not found

TC_16 GetSellerDetails with More than 36 SellerId
    [Documentation]  Invalid : To verify response when sellerId  parameter is entered more than size 36
    [Tags]  E08
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}abc2c2p   E08   Data not found

TC_17 GetSellerDetails with Valid SellerID and status is Active
    [Documentation]  Valid : To check API response when sellerId parameter is entered Valid and seller status is Active and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_18 GetSellerDetails with Valid SellerId and Status is Locked
    [Documentation]  Valid : To check API response when sellerId parameter is entered Valid and seller status is Locked and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${2}
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_19 GetSellerDetails with Valid SellerId and Status is Suspended
    [Documentation]  Valid : To check API response when sellerId parameter is entered Valid and seller status is Suspended and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${3}
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_20 GetSellerDetails with Valid SellerId and Status is Terminated
    [Documentation]  Valid : To check API response when sellerId parameter is entered Valid and seller status is Terminated and request is sent with all mandatory fields
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${4}
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   status
    Log to Console  "Seller Status is : "${Value}

TC_21 GetSellerDetails with valid SellerId and Valid Format
    [Documentation]  Valid: To Verify format of sellerId in API request of Get Seller Detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   sellerId
    Log to Console  "SellerId is : "${Value}

TC_22 GetSellerDetails with valid SellerId and Valid CreateDate Format
    [Documentation]  Valid: To Verify format of createDate in API response of Get Seller Detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   createDate
    Log to Console  "Seller Created Date is : "${Value}

TC_23 GetSellerDetails with valid SellerId and Valid UpdateDate Format
    [Documentation]  Valid: To Verify format of updateDate in API response of Get Seller Detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    UpdateSeller to convert   ${TokenEscrow}  @{escrowCompId}  ${SellerId}  ${1}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   updateDate
    Log to Console  "Seller Updated Date is : "${Value}

TC_24 GetSellerDetails with valid SellerId and Valid OtherVerification Format
    [Documentation]  Valid: To Verify format of otherVerification in API response of Get Seller Detail API
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   otherVerification
    Log to Console  "OtherVerification is : "${Value}

TC_25 GetSellerDetails with Thai FirstNameLocal, LastNameLocal, TitleLocal
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with firstNameLocal , lastNameLocal , titleLocal  in Thai language
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   titleLocal
    Log to Console  "Title in Thai : "${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   firstNameLocal
    Log to Console  "FirstName in Thai : "${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   lastNameLocal
    Log to Console  "LastName in Thai : "${Value}

TC_26 GetSellerDetails with Valid Address and Mailing Address
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with address and mailingAddress  in EN language
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   address
    Log to Console  "Address : "${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   mailingAddress
    Log to Console  "MailingAddress : "${Value}

TC_27 GetSellerDetails with Valid UserDefine 1-5
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with userdefine 1-5  in EN language
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine1
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine2
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine3
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine4
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine5
    Log to Console  ${Value}

TC_28 GetSellerDetails with Thai Address and Mailing Address Details
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with address and mailingAddress  in Thai language
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID with Thai Data
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   address
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   mailingAddress
    Log to Console  ${Value}

TC_29 GetSellerDetails with Thai UserDefined 1-5
    [Documentation]  Valid : To Check the system return data correctly in the response when User is registered with userdefine 1-5  in Thai language
    [Tags]  000
    ${TokenEscrow}=  GetToken Escrow
    ${SellerId}  ${IdNumber}=  RegisterSellerID with Thai Data
    GetSellerDetails  ${TokenEscrow}  @{escrowCompId}  ${SellerId}  000  Success
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine1
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine2
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine3
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine4
    Log to Console  ${Value}
    ${Value}=  GetSellerDetails ReturnAttribute   ${TokenEscrow}   @{escrowCompId}   ${SellerId}   userDefine5
    Log to Console  ${Value}
