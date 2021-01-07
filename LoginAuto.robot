*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${email}    xpath=//div[@id="tab-login"]/form/div[1]/input[@name="email"]
${password}    xpath=//div[@id="tab-login"]/form/div[2]/input[@name="password"]
${login}     xpath=//form/button[@class="btn btn-success btn-block"]
${errormsg}  xpath=//div[@id="login-invalid" and contains(text(),'The email address or password is incorrect. ')]
${requiredEmail}  xpath=//div[@id="tab-login"]/form/div[1]/span[contains(text(),'This field is required.')]
${requiredPass}  xpath=//div[@id="tab-login"]/form/div[1]/span[contains(text(),'This field is required.')]
${invalidEmail}   xpath=//div[@id="tab-login"]/form/div[1]/span[contains(text(),'Please enter a valid email address (e.g.: john.smith@gmail.com).')]
*** Test Cases ***
Go to Optimyapp 
    Open Browser  http://login.optimyapp.com  chrome
    Maximize browser window
    Input Text    ${email}        Mayegallardo5@gmail.com
    Input Text    ${password}     gallardo01   
    Click Button  ${login}   
    Wait Until Element Contains    ${errormsg}  The email address or password is incorrect.  
    Close browser

Go to Optimyapp1 
    Open Browser  http://login.optimyapp.com  chrome
    Maximize browser window
    Input Text    ${email}  ${EMPTY}      
    Input Text    ${password}     ${EMPTY}    
    Click Button  ${login}   
    Wait Until Element Contains    ${requiredEmail}  This field is required. 
    Wait Until Element Contains    ${requiredPass}  This field is required.
    Close browser

Go to Optimyapp2 
    Open Browser  http://login.optimyapp.com  chrome
    Maximize browser window
    Input Text    ${email}  maye  
    Click Button  ${login}         
    Wait Until Element Contains    ${invalidEmail}  Please enter a valid email address (e.g.: john.smith@gmail.com). 
    Close browser
    
