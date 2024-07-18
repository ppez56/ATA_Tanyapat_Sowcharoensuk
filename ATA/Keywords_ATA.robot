*** Settings ***
Library        SeleniumLibrary
Resource        /Users/peempeem/Documents/ATA/Locators_ATA.robot
Variables       /Users/peempeem/Documents/ATA/data.yaml

*** Keywords ***    
Open Saucedemo
    [Arguments]    ${url}    ${browser}
    SeleniumLibrary.Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Valid Username
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Username_Field}    timeout=10s
    SeleniumLibrary.Input Text    ${Username_Field}    text=standard_user

Input Valid Password
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Password_Field}    timeout=10s
    SeleniumLibrary.Input Text    ${Password_Field}    text=secret_sauce

Click Login
    SeleniumLibrary.Wait Until Page Contains Element    ${Login_Button_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${Login_Button_Field}
    
Check Text Header Title 
    [Arguments]    ${Head_Title}
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Product_Title_Field}    timeout=10s
    SeleniumLibrary.Element Text Should Be    ${Product_Title_Field}    ${Head_Title}

Sorting Products From High to Low
    SeleniumLibrary.Wait Until Page Contains Element    ${Sorting_Container_Field}    timeout=10s
    SeleniumLibrary.Select From List By Value    ${Sorting_Container_Field}    hilo

Add Highest Price to Cart
    Sleep    500ms
    SeleniumLibrary.Scroll Element Into View    ${Add_to_Cart_Most_Expensive}     
    SeleniumLibrary.Wait Until Page Contains Element    ${Add_to_Cart_Most_Expensive}    timeout=10s
    SeleniumLibrary.Click Element    ${Add_to_Cart_Most_Expensive}

Add Lowest Price to Cart
    Sleep    500ms
    SeleniumLibrary.Scroll Element Into View    ${Add_to_Cart_Least_Expensive}     
    SeleniumLibrary.Wait Until Page Contains Element    ${Add_to_Cart_Least_Expensive}    timeout=10s
    SeleniumLibrary.Click Element    ${Add_to_Cart_Least_Expensive}

Click Shopping Cart
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Shopping_Cart_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${Shopping_Cart_Field}

Proceed CheckOut
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Check_Out_Button_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${Check_Out_Button_Field}

Input Personal Information
    Sleep    1s
    SeleniumLibrary.Wait Until Page Contains Element    ${FirstName_Field}    timeout=10s
    SeleniumLibrary.Input Text    ${FirstName_Field}    text=Tanyapat
    SeleniumLibrary.Input Text    ${LastName_Field}    text=Sowcharoensuk
    SeleniumLibrary.Input Text    ${Postal_Code_Field}    text=10500

Click Continue
    Sleep    500ms
    SeleniumLibrary.Scroll Element Into View    ${Continue_Button_Field}
    SeleniumLibrary.Wait Until Page Contains Element    ${Continue_Button_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${Continue_Button_Field}

Click Finish
    Sleep    500ms
    SeleniumLibrary.Scroll Element Into View    ${Finish_Button_Field}
    SeleniumLibrary.Wait Until Page Contains Element    ${Finish_Button_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${Finish_Button_Field}
    Sleep    1s
    SeleniumLibrary.Wait Until Page Contains Element        id=back-to-products    timeout=10s
    SeleniumLibrary.Click Element    id=back-to-products

Log CheckOut Summary
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Summary_CheckOut_Field}
    ${element_text}=    Get Text    ${Summary_CheckOut_Field}
    Log    The Error: ${element_text}
    Sleep    500ms

Click Logout 
    Sleep    1s
    SeleniumLibrary.Wait Until Page Contains Element    ${Menu_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${Menu_Field}
    Sleep    1s
    SeleniumLibrary.Wait Until Page Contains Element    ${LogOut_Field}    timeout=10s
    SeleniumLibrary.Click Element    ${LogOut_Field}

Input Locked_Out Username
    Sleep    500ms
    SeleniumLibrary.Wait Until Page Contains Element    ${Username_Field}    timeout=10s
    SeleniumLibrary.Input Text    ${Username_Field}    text=locked_out_user

Validate LockedOut User
    Sleep    1s
    SeleniumLibrary.Wait Until Page Contains Element    ${Error_Field}
    ${element_text2}=    Get Text    ${Error_Field}
    Log    The Summary of CheckOut are: ${element_text2}

