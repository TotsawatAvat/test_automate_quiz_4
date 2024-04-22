*** Settings ***
Resource  ${CURDIR}/../resource/import.robot


*** Test Cases ***
Test case 06
    [Tags]           tc_06
    [Documentation]  ทดสอบ สร้างรายการ กรณี เลือกวัน และเวลาที่เป็นอดีต
        tc_keyword.Open application page
        tc_keyword.Click create list
        tc_keyword.Input name list  ${tc_06 ['create'] ['name']}
        tc_keyword.Click notification
        sleep  2
        tc_keyword.Click add date
        tc_keyword.Click confirm datetime
        tc_keyword.Click add time
        tc_keyword.Click confirm datetime
        tc_keyword.Verify notification error
        tc_keyword.Click confirm list
        sleep  2
        tc_keyword.Verify page not fount