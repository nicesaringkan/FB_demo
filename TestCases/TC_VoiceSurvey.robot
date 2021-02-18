*** Settings ***
Library  Selenium2Library

Test Template    VoiceSurvey

*** Variables ***
${urlVoiceSurvey}    https://surveyconduct.feedback180.com/51dxhj0o
# Link Production : https://app-cxvoicesurveyweb-uat.azurewebsites.net/E1/1
# Link Survey Mockup : https://surveyconduct.feedback180.com/51dxhj0o
${BROWSER}    headlesschrome    

# Elements
${btnStart}    xpath=//button
${btnNexT}    xpath=//button[contains(text(),'ถัดไป')]
${btnSubmit}    xpath=//div/button[@class='survey_button button_next']
${inputText}    xpath=//textarea
${ThankYouText}    xpath=//div[@class='thank_you_description']

*** Test Cases ***    ${Text1}    ${Text2}    ${Text3}
TC_02_01	Test_01    ทดสอบตอบ 1	    อาหารหมด พนักงานไม่ค่อยดู
TC_02_02	Test_02    ทดสอบตอบ 2	    อาหารรู้สึกไม่ค่อยสด
TC_02_03	Test_03    ทดสอบตอบ 3	    อาหารมีให้เลือกน้อย
TC_02_04	Test_04    ทดสอบตอบ 4	    อาหารน้อยลง
TC_02_05	Test_05    ทดสอบตอบ 5	    อาหารควรหลากหลายกว่านี้
TC_02_06	Test_06    ทดสอบตอบ 6	    อิ่มอร่อย
TC_02_07	Test_07    ทดสอบตอบ 7	    อร่อยมากๆขอให้ได้รางวัล
TC_02_08	Test_08    ทดสอบตอบ 8	    รดชาติดีค่ะ
TC_02_09	Test_09    ทดสอบตอบ 9	    พนักงานบริการดีมากค่ะ
TC_02_10	Test_10    ทดสอบตอบ 10	ผักไม่ค่อยสด
    
*** Keywords ***
VoiceSurvey
    [Arguments]    ${Text1}    ${Text2}    ${Text3}
     Open Browser    ${urlVoiceSurvey}    ${BROWSER}    options=add_argument("--use-fake-ui-for-media-stream")    
     Wait Until Page Contains Element    ${btnStart}    20  None
     Click Button    ${btnStart}
     Wait Until Page Contains    1. กรุณาบอกเล่าความคิดเห็นที่คุณมีต่อการใช้บริการหรือผลิตภัณฑ์ของเราในครั้งล่าสุด     
     Input Text    ${inputText}    ${Text1}
     Click Button    ${btnNexT}
     Wait Until Page Contains    2. ขออภัยหากคุณไม่ได้รับประสบการณ์ที่ดีจากการใช้บริการหรือผลิตภัณฑ์ของเรา กรุณาระบุรายละเอียดเพื่อช่วยให้เราปรับปรุงและพัฒนาการบริการหรือผลิตภัณฑ์ของเราให้ดียิ่งขึ้น 
     Input Text    ${inputText}    ${Text2}   
     Click Button    ${btnNexT}
     Wait Until Page Contains    3. คุณมีคำแนะนำเพิ่มเติมหรือไม่ เพื่อที่เราจะมั่นใจว่าคุณจะได้รับการบริการที่ดีจากเรา
     Input Text    ${inputText}    ${Text3}
     Click Button     ${btnSubmit}
     Sleep    5s
     #Wait Until Page Contains Element    ${ThankYouText}    20  None 
     Close Browser