*** Settings ***
Library    RequestsLibrary
Library    ../.venv/Lib/site-packages/robot/libraries/DateTime.py
Library    Collections


*** Variables ***
${base_url}    https://api.restful-api.dev
${computer}    7


*** Test Cases ***
Get_weatherInfo
    Create Session    myssion    ${base_url}
    ${response}=    GET On Session    myssion    /objects/${computer}
    #Log To Console    ${response.status_code}
    #Log To Console    ${response.content}
    #Log To Console    ${response.headers}


    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200


    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    Apple MacBook Pro 16


    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    application/json




