*** Settings ***
Library    Browser
Library    RPA.JSON
Library    OperatingSystem
*** Variables ***
${HAR_FILE_PATH}=    ${OUTPUT_DIR}${/}example.har

*** Tasks ***
Record HAR file
    Init File
    Configure HAR
    New Page        https://example.com/    
    Parse HAR

*** Keywords ***
Init File
    Create File    ${HAR_FILE_PATH}
Configure HAR   
    ${har_config}=
    ...    Create Dictionary
    ...    path=${HAR_FILE_PATH}
    ...    omitContent=True
    New Browser    chromium    headless=false
    New Context    recordHar=${har_config}    ignoreHTTPSErrors=true
    
Parse HAR
    ${json}=    Load Json From File    ${HAR_FILE_PATH}
    ${urls}=    Get value from JSON    ${json}    $..url
    Save JSON to file    ${urls}    ${OUTPUT_DIR}${/}urls.json   

   
