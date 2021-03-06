*** Settings ***
Library           OperatingSystem
Resource          ../Trellis_Vars.robot

*** Test Cases ***
/api/v2/services GET
    [Tags]    functional
    Comment    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v2/services | python -mjson.tool
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}g/api/v2/services
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    Should Contain    ${output}    "email": "${User1EMail}"
    Should Contain    ${output}    "firstname": "${User1First}"
    Should Contain    ${output}    "lastname": "${User1Last}"

/api/v2/services/iplant-data-store GET
    [Tags]    functional
    Comment    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v2/services/iplant-data-store | python -mjson.tool
    ${output} =    Run    curl -s -u ${PubKey}:${PrivKey} https://${WebHost}/api/v2/services/iplant-data-store
    Log    ${output}
    Should Not Contain    ${output}    "Auth": "Unrecognized API Client"
    Should Not Contain    ${output}    "error": {
    Should Contain    ${output}    "email": "${User1EMail}"
    Should Contain    ${output}    "firstname": "${User1First}"
    Should Contain    ${output}    "lastname": "${User1Last}"
