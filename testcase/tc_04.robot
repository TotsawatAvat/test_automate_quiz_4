*** Settings ***
Resource  ${CURDIR}/../resource/import.robot


*** Test Cases ***
Test case 04
    [Tags]           tc_04
    [Documentation]  ทดสอบ สร้างรายการ กรณี กรอกชื่อซ้ำ
        tc_keyword.Open application page
        ${datetime}=  tc_keyword.Create list  ${tc_04 ['create'] ['list1'] ['name']}
        tc_keyword.Click create list
        tc_keyword.Input name list  ${tc_04 ['create'] ['list2'] ['name']}
        tc_keyword.Click confirm list
        sleep  2
        tc_keyword.Verify name ary  ${tc_04 ['create'] ['list1'] ['index']}  ${tc_04 ['create'] ['list1'] ['name']}
        tc_keyword.Verify name ary  ${tc_04 ['create'] ['list2'] ['index']}  ${tc_04 ['create'] ['list2'] ['name']}