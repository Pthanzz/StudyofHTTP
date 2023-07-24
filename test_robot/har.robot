*** Settings ***
Library    Browser
Library    RPA.JSON

*** Variables ***
${HAR_FILE_PATH}=    ${OUTPUT_DIR}${/}wikipedia.har

*** Tasks ***
Record HAR file
    Configure HAR
    New Page    https://wikipedia.org
    Parse HAR

*** Keywords ***
Configure HAR
    ${har_config}=
    ...    Create Dictionary
    ...    path=${HAR_FILE_PATH}
    ...    omitContent=True
    New Context    recordHar=${har_config}

Parse HAR
    ${json}=    Load Json From File    ${HAR_FILE_PATH}
    ${urls}=    Get value from JSON    ${json}    $..url
    Save JSON to file    ${urls}    ${OUTPUT_DIR}${/}urls.json

        
