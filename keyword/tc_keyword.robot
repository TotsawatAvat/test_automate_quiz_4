*** Keywords ***
Open application page
    [Documentation]  เปิดแอปพลิเคชัน
        Appiumlibrary.Open Application
        ...    remote_url=${open_app ['url']}  alias=${open_app ['alias']}  automationName=${open_app ['automationName']}
        ...    deviceName=${open_app ['deviceName']}  platformName=${open_app ['platformName']}  platformVersion=${open_app ['platformVersion']}
        ...    appPackage=${open_app ['appPackage']}  appActivity=${open_app ['appActivity']}  noReset=false  noScreenshot=true

Create list
    [Arguments]      ${name}
    [Documentation]  สร้างรายการ
        tc_keyword.Click create list
        tc_keyword.Input name list  ${name}
        tc_keyword.Click notification
        sleep  2
        ${datetime}=  tc_keyword.Collect datetime
        tc_keyword.Click confirm list
        sleep  2
    RETURN  ${datetime}

Edit list
    [Arguments]      ${name}
    [Documentation]  แก้ไขรายการ
        tc_keyword.Srlect list
        tc_keyword.Input name list  ${name}
        tc_keyword.Click confirm list
        sleep  2

Delete list
    [Arguments]      ${position}
    [Documentation]  แก้ไขรายการ
        Appiumlibrary.Swipe  ${position ['start_x']}  ${position ['start_y']}  ${position ['end_x']}  ${position ['start_y']}  ${position ['duration']}
        sleep  2

# Calculate coordinates
#     [Arguments]      ${X1}  ${Y1}  ${X2}  ${Y2}
#     [Documentation]  xxxx
#         ${X_COORDINATE}=  BuiltIn.Evaluate  (${X1} + ${X2}) / 2
#         ${Y_COORDINATE}=  BuiltIn.Evaluate  (${Y1} + ${Y2}) / 2
#         ${X_INT}=  BuiltIn.Convert To String  ${X_COORDINATE}
#         ${Y_INT}=  BuiltIn.Convert To String  ${Y_COORDINATE}
#         @{firstFinger}=  BuiltIn.Create List  ${X_INT}  ${Y_INT}
#     RETURN  @{firstFinger}

Click create list
    [Documentation]  คลิก 'เพิ่มรายการใหม่'
        Appiumlibrary.Click Element  ${xpath_tc___button__create_lise}

Click confirm list
    [Documentation]  คลิก 'ยืนยันรายการ'
        Appiumlibrary.Click Element  ${xpath_tc___button__confirm_lise}

Click notification
    [Documentation]  คลิก 'การแจ้งเตือน'
        Appiumlibrary.Click Element  ${xpath_tc___button__notification}

Click add date
    [Documentation]  คลิก 'เพิ่มวันเดือนปี'
        Appiumlibrary.Click Element  ${xpath_tc___button__add_date}

Click add time
    [Documentation]  คลิก 'เพิ่มเวลา'
        Appiumlibrary.Click Element  ${xpath_tc___button__add_time}

Click confirm datetime
    [Documentation]  คลิก 'ยืนยันวันเวลา'
        Appiumlibrary.Click Element  ${xpath_tc___button__confirm_datetime}

Input name list
    [Arguments]      ${name}
    [Documentation]  กรอก 'ชื่อรายการ'
        Appiumlibrary.Wait Until Element Is Visible  ${xpath_tc___input__list}
        Appiumlibrary.Clear Text  ${xpath_tc___input__list}
        Appiumlibrary.Input Text  ${xpath_tc___input__list}  ${name}

Srlect list
    [Documentation]  เลือก 'รายการ'
        Appiumlibrary.Click Element  ${xpath_tc___button__select_name_list}

Collect datetime
    [Documentation]  เก็บค่า 'วันที่แจ้งแตือน'
        ${result}=    Appiumlibrary.Get Text  ${xpath_tc___text__message_notification}
        ${step1}=     String.Replace String  ${result}  Reminder set for  ${EMPTY}
        ${step2}=     String.Replace String  ${step1}  ,  ${EMPTY}
        ${step3}=     String.Split String  ${step2}
        ${datetime}=  BuiltIn.Set Variable  ${step3}[1] ${step3}[0], ${step3}[2] ${SPACE}${step3}[3] ${step3}[4]
    RETURN  ${datetime}

Replace string
    [Arguments]      ${xpt_change_befor}  ${str_data_change}
    [Documentation]  จัดการแปลง xpath
    ${xpt_result}=  BuiltIn.Create List
    @{keys}=  Collections.Get Dictionary Keys  ${str_data_change}  sort_keys=${False}
    FOR  ${index}  IN  @{keys}
            IF  '${index}' == '${keys}[0]'
                    ${xpt_change_after}=  String.Replace String  ${xpt_change_befor}  ${index}  ${str_data_change}[${index}]
                    ${xpt_result}=  BuiltIn.Set Variable  ${xpt_change_after}
            ELSE
                ${xpt_result}=  String.Replace String  ${xpt_result}  ${index}  ${str_data_change}[${index}]
            END
    END
    RETURN  ${xpt_result}

Verify name
    [Arguments]      ${name}
    [Documentation]  ตรวจสอบ ชื่อรายการ
        Appiumlibrary.Element Should Contain Text  ${xpath_tc___button__select_name_list}  ${name}

Verify name ary
    [Arguments]      ${index}  ${name}
    [Documentation]  ตรวจสอบ ชื่อรายการอาเรย์
        &{str_replace}=  BuiltIn.Create dictionary  ***INDEX***=${index}
        ${new_xpath}=  tc_keyword.Replace string  ${xpath_tc___button__select_name_list_ary}  ${str_replace}
        Appiumlibrary.Element Should Contain Text  ${new_xpath}  ${name}

Verify datetime
    [Arguments]      ${datetime}
    [Documentation]  ตรวจสอบ วันที่แจ้งเตือน
        Appiumlibrary.Element Should Contain Text  ${xpath_tc___button__select_date_list}  ${datetime}

Verify notification error
    [Documentation]  ตรวจสอบ ข้อความแจ้งเตือนผิดพลาด
        Appiumlibrary.Element Should Contain Text  ${xpath_tc___text__message_notification_error}  The date you entered is in the past.

Verify page not fount
    [Documentation]  ตรวจสอบ หน้ารายการว่าง
        Appiumlibrary.Element Should Be Visible  ${xpath_tc___page_notfount ['icon']}
        Appiumlibrary.Element Should Be Visible  ${xpath_tc___page_notfount ['text']}