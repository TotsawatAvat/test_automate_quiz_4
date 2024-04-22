*** Settings ***
Library    String
Library    Collections
Library    AppiumLibrary

# keyword
Resource   ${CURDIR}/../keyword/tc_keyword.robot

# resource
Variables  ${CURDIR}/data/tc_data.yaml
Variables  ${CURDIR}/locator/tc_locator.yaml