*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../.venv/Lib/site-packages/robot/libraries/OperatingSystem.py

*** Variables ***
${base_url}=    https://api.restful-api.dev


*** Test Cases ***
Put_LaptopRegistration
    Create Session    myssion    ${base_url}
    ${data}=    Create Dictionary
    ...    year=2019
    ...    price=1849.99
    ...    CPU model=Intel Core i9
    ...    Hard disk size=1 TB
    
    ${body}=    Create Dictionary
    ...    name=Techno
    ...    data=${data}
    

    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    myssion    /objects    json=${body}    headers=${headers}
    
    ${status_code}=    Convert To String    ${response.status_code}

    Log To Console    ${status_code}
    Log To Console    ${response.content}


    #VALIDATIONS
    Should Be Equal    ${status_code}    200

    Should Contain    ${response.content}    Techno