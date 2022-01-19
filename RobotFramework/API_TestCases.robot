*** Settings ***
Documentation    This script used to test an API
...              Verification of Functional and non functional test cases
Resource         keywords.resource


*** Test Cases ***
TC00_Create_HTTP_Session
    [Documentation]     This test case creates HTTP session with specified url
    Create Session      api_url     ${base_url}     verify=True
    log                 HTTP session created with ${base_url}

TC01_Verify_get_response
    [Documentation]     This test case verify get response code as 200
    ${response}=        GET On Session      api_url     public/v1/users     params=access-token=${token}
    log to console      ${response.status_code}
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}      200

TC02_Verify_response_json_data
    [Documentation]     This test case validates get response data is valid json
    ${response}=        GET On Session      api_url     public/v1/users
    log to console      Verify JSON data is valid or not
    #Store reponse json data to variable for validation
    ${json_obj}=        set variable        ${response.json()}
    log to console      GET response have valid JSON format ${json_obj}

TC03_Verify_pagination
    [Documentation]     This test case verifies API response has pagination
    ${response}=        GET On Session      api_url     public/v1/users
    ${data}=        set variable        ${response.json()}
    Verify Pagination   ${data}

TC04_Verify_user_email
    [Documentation]     This test case will verify email address availability in user data
    ${response}=        GET On Session      api_url     public/v1/users
    verify valid email  ${response.json()}

TC05_Verify_user_data
    [Documentation]     This test case will verify all users data attributes are similar
    ${response}=        GET On Session      api_url     public/v1/users
    verify users data   ${response.json()}
