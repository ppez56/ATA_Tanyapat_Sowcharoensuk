*** Settings ***
Library        SeleniumLibrary
Resource        /Users/peempeem/Documents/ATA/Locators_ATA.robot
Resource        /Users/peempeem/Documents/ATA/Keywords_ATA.robot
Variables       /Users/peempeem/Documents/ATA/data.yaml

Suite Setup      Log To Console    message=Test1

*** Test Cases ***
Verify Open Website
    [Tags]    TC00
    Open Saucedemo    url=${url}    browser=${browser}
    
Verify Login with Valid User Credentials Successfully
    [Tags]    TC01    
    Input Valid Username
    Input Valid Password
    Click Login
    Check Text Header Title    Head_Title=${Head_Title}
    
Verify Sorting Products From High to Low
    [Tags]    TC02
    Sorting Products From High to Low    

Verify Adding Cart 2 Items
    [Tags]    TC03
    Add Highest Price to Cart
    Add Lowest Price to Cart

Verify Proceed to CheckOut
    [Tags]    TC04
    Click Shopping Cart
    Proceed CheckOut
    Input Personal Information
    Click Continue
    
Verify CheckOut Summary
    [Tags]    TC05
    Log CheckOut Summary
    Click Finish
    
Verify Logout Success
    [Tags]    TC06
    Click Logout

Verify Validate Locked Out User
    [Tags]    TC07
    Input Locked_Out Username
    Input Valid Password
    Click Login
    Validate LockedOut User