*** Settings ***
Resource  ${CURDIR}/../resource/import.robot


*** Test Cases ***
Test case 01
    [Tags]           tc_01
    [Documentation]  ทดสอบ สร้าง แก้ไข ลบรายการ กรณี ปกติ
        tc_keyword.Open application page
        ${datetime}=  tc_keyword.Create list  ${tc_01 ['create'] ['name']}
        tc_keyword.Verify name  ${tc_01 ['create'] ['name']}
        tc_keyword.Verify datetime  ${datetime}
        tc_keyword.Edit list  ${tc_01 ['edit'] ['name']}
        tc_keyword.Verify name  ${tc_01 ['edit'] ['name']}
        tc_keyword.Delete list  ${tc_01 ['delete'] ['position']}
        tc_keyword.Verify page not fount