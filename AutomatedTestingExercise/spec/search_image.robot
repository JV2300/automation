*** Settings ***
Documentation	Search by Image
Library     SeleniumLibrary
Variables         ../environments/test_env.py
Suite Teardown      Close browser



*** Variables ***
${BROWSER}      Firefox
${imagebutton}    //*[contains(./@class,'nDcEnd')]
${upload a file}   //*[contains(./@class,'DV7the')]
${result}           xpath=//div[${VISIT_RESULT}]/div/div/a/div/div/div/img



*** Test Cases ***

Open Browser To Search Image
        Open Browser    ${url}    ${BROWSER}
        Maximize Browser Window
        Wait Until Element is Visible   q
        Search Image
        Capture Page Screenshot     ${CURDIR}${/}${result_screenshot_path}${/}screenshot${VISIT_RESULT}.png


*** Keywords ***
Search Image
    Click Element   ${imagebutton}
    Wait Until Element is Visible  ${upload a file}
    Choose File    name=encoded_image    ${CURDIR}${/}${image_path}
    Wait Until Element is Visible       ${result}
    Sleep    3s
    Click Image     ${result}
    Switch Window
