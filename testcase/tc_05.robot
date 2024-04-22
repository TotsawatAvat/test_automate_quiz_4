*** Settings ***
Resource  ${CURDIR}/../resource/import.robot


*** Test Cases ***
Test case 05
    [Tags]           tc_05
    [Documentation]  ทดสอบ สร้างรายการ กรณี กรอกชื่อยาว
        tc_keyword.Open application page
        ${datetime}=  tc_keyword.Create list  ${tc_05 ['create'] ['name']}
        tc_keyword.Verify name  ${tc_05 ['create'] ['name']}
        tc_keyword.Verify datetime  ${datetime}