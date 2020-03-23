*** Settings ***
Library  convertstringtodict.py
*** Variables ***
${data}=  {"escrowCompanyId": "001", "idNumber": "3672901928303", "typeOfId": 3, "mobileCountryCode": "35", "mobileNo":"3892830456", "email": "suraj+100@2c2pexternal.com", "gender": "M", "titleEn": "MR.", "firstNameEn": "Suraj","lastNameEn": "M", "titleLocal": "นาย", "firstNameLocal": "สมชาย", "lastNameLocal": "ขายดี", "dateOfBirth":"20/02/1987", "nationalityId": "764", "otherVerification": "SM0928716357", "workPlace": "test", "userDefine1":"u1", "userDefine2": "u2", "userDefine3": "u3", "userDefine4": "u4", "userDefine5": "u5", "kycRequest": 0,"address": { "homeAddress1": "addh1", "homeAddress2": "addh2", "countryId": "764", "stateId": "001","state": "Bangkok", "postalCode": "10100", "addressDefine1": "Ad1", "addressDefine2": "ad2", "addressDefine3":"ad3", "addressDefine4": "ad4" }, "mailingAddress": { "mailAddress1": "m1", "mailAddress2": "m2", "countryId": "764", "stateId": "002", "state": "BAngkok", "postalCode": "11100", "addressDefine1": "ad1.1", "addressDefine2":"ad2.1", "addressDefine3": "ad3.1", "addressDefine4": "ad4.1" } }
*** Test Cases ***
Demo Case 1
    ${body}=   convertstringtodict  ${data}
    log to console  ${body}