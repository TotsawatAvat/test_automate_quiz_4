*** Settings ***
Resource  ${CURDIR}/../resource/import.robot


*** Test Cases ***
Test case 02
    [Tags]           tc_02
    [Documentation]  ทดสอบ สร้างรายการ กรณี ไม่กรอกชื่อ
        tc_keyword.Open application page
        tc_keyword.Click create list
        Sleep  2
        tc_keyword.Click notification
        tc_keyword.Click confirm list
        tc_keyword.Verify page not fount