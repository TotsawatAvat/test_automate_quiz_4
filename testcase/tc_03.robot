*** Settings ***
Resource  ${CURDIR}/../resource/import.robot


*** Test Cases ***
Test case 03
    [Tags]           tc_03
    [Documentation]  ทดสอบ สร้างรายการ กรณี ไม่กรอกการแจ้งเตือน
        tc_keyword.Open application page
        tc_keyword.Click create list
        tc_keyword.Input name list  ${tc_03 ['create'] ['name']}
        tc_keyword.Click confirm list
        tc_keyword.Verify name  ${tc_03 ['create'] ['name']}