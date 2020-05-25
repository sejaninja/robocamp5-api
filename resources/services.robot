***Settings***
Documentation    Aqui nós vamos encapsular algumas chamdas de serviços

Library     Collections
Library     RequestsLibrary
Library     libs/database.py
Resource    helpers.robot

***Variables***
${base_url}    http://pixel-api:3333

${user_email}    papito@ninjapixel.com
${user_pass}     pwd123

***Keywords***
#hooks
Set Suite Var Auth Token
    [Arguments]    ${email}    ${password}

    ${resp}     Post Token           ${email}                       ${password}
    ${token}    Convert To String    JWT ${resp.json()['token']}

    Set Suite Variable    ${token}

#steps
Post Token
    [Arguments]    ${email}    ${password}

    Create Session    pixel    ${base_url}

    &{headers}=    Create Dictionary    Content-Type=application/json
    &{payload}=    Create Dictionary    email=${email}                   password=${password}

    ${resp}=    Post Request    pixel    /auth    data=${payload}    headers=${headers}

    [return]    ${resp}

Post Product
    [Arguments]    ${payload}    ${remove}

    Run Keyword If    "${remove}" == "before_remove" 
    ...               Remove Product By Title            ${payload['title']}

    Create Session    pixel                ${base_url}
    &{headers}=       Create Dictionary    Authorization=${token}    Content-Type=application/json

    ${resp}=    Post Request    pixel    /products    data=${payload}    headers=${headers}

    [return]    ${resp}

Put Product
    [Arguments]    ${product_id}    ${payload}

    Remove Product By Title            ${payload['title']}

    Create Session    pixel                ${base_url}
    &{headers}=       Create Dictionary    Authorization=${token}    Content-Type=application/json

    ${resp}=    Put Request    pixel    /products/${product_id}    data=${payload}    headers=${headers}

    [return]    ${resp}

Get Product
    [Arguments]    ${id}

    Create Session    pixel                ${base_url}
    &{headers}=       Create Dictionary    Authorization=${token}    Content-Type=application/json

    ${resp}=    Get Request    pixel    /products/${id}    headers=${headers}

    [return]    ${resp}

Get Products
    Create Session    pixel                ${base_url}
    &{headers}=       Create Dictionary    Authorization=${token}    Content-Type=application/json

    ${resp}=    Get Request    pixel    /products    headers=${headers}

    [return]    ${resp}

Delete Product
    [Arguments]    ${id}

    Create Session    pixel                ${base_url}
    &{headers}=       Create Dictionary    Authorization=${token}    Content-Type=application/json

    ${resp}=    Delete Request    pixel    /products/${id}    headers=${headers}

    [return]    ${resp}