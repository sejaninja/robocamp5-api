***Settings***
Documentation       POST /products
...                 Testes do cadastro de produtos consumindo a API

Resource            ../../resources/services.robot

Suite Setup         Set Suite Var Auth Token      ${user_email}    ${user_pass}

***Test Cases***
Create a new Product
    ${payload}=     Get Json        dk2.json

    ${resp}=        Post Product    ${payload}     before_remove
    Status Should Be        200     ${resp}

Duplicate Product
    ${payload}=     Get Json        duplicate.json

    Post Product    ${payload}        before_remove
    ${resp}=        Post Product    ${payload}     ${empty}

    Status Should Be        409     ${resp}

Empty Title
    ${payload}=     Get Json        empty_title.json

    ${resp}=        Post Product    ${payload}     ${empty}
    Status Should Be        400     ${resp}

Empty Category
    ${payload}=     Get Json        empty_cat.json

    ${resp}=        Post Product    ${payload}     ${empty}
    Status Should Be        400     ${resp}

Empty Price
    ${payload}=     Get Json        empty_price.json

    ${resp}=        Post Product    ${payload}     ${empty}
    Status Should Be        400     ${resp}