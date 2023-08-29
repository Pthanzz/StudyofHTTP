***Setting***
Library    Browser

***Variable***
${RecordWeb}    https://example.com

*** Tasks ***
RecordWeb
    New Browser    chromium    headless=false
    New Context    ignoreHTTPSErrors=true
    New Page    ${RecordWeb}
