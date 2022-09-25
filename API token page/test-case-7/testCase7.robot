#TC07 - Copying token generated

*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    password
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    dt_core_account-info_acc-info    30

Navigate To Demo Account
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Click Element    dt_core_account-info_acc-info
    Click Element    //*[@id="dt_core_account-switcher_demo-tab"]
    Click Element    //*[@id='dt_VRTC6744793']

Navigate To "Manage Account Settings" Page
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    30
    Click Element    //*[@class="dc-icon"]

Navigate To API Token Page
    Wait Until Page Contains Element    //*[@class="dc-vertical-tab__tab dc-vertical-tab__tab--floating"]    20
    Wait Until Page Contains Element    //*[@class="dc-vertical-tab__header dc-vertical-tab__header--floating" and contains(.,"API token")]    20
    Click Element    //*[@class="dc-vertical-tab__header dc-vertical-tab__header--floating" and contains(.,"API token")]

Select Scopes
    Wait Until Page Contains Element    //label[@class="dc-checkbox"]    20
    Wait Until Page Contains Element    //label[@class="dc-checkbox" and contains(.,"Read")]    20
    Click Element    //label[@class="dc-checkbox" and contains(.,"Read")]
    Wait Until Page Contains Element    //label[@class="dc-checkbox" and contains(.,"Trade")]    20
    Click Element    //label[@class="dc-checkbox" and contains(.,"Trade")]
    Wait Until Page Contains Element    //label[@class="dc-checkbox" and contains(.,"Payments")]    20
    Click Element    //label[@class="dc-checkbox" and contains(.,"Payments")]
    Wait Until Page Contains Element    //label[@class="dc-checkbox" and contains(.,"Trading information")]    20
    Click Element    //label[@class="dc-checkbox" and contains(.,"Trading information")]
    Wait Until Page Contains Element    //label[@class="dc-checkbox" and contains(.,"Admin")]    20
    Click Element    //label[@class="dc-checkbox" and contains(.,"Admin")]


Create Token Name
     Wait Until Page Contains Element    //*[@class="dc-input__field"]    20
     Click Element    //*[@class="dc-input__field"]
     Press Keys    //*[@class="dc-input__field"]    sun  
     Click Element    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
     Wait Until Page Contains Element    //*[@class='dc-text' and contains(.,'sun')]    20
     Wait Until Page Contains Element    //*[@class="da-api-token__table-cell-row" and contains(.,'Read') and contains(.,'Trade') and contains(.,'Payments') and contains(.,'Trading information') and contains(.,'Admin')][1]    20

Copy Token
    Click Element    //*[@class='dc-icon dc-clipboard']
    Click Element    //*[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']