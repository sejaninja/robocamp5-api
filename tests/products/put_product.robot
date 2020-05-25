***Settings***
Documentation       PUT /products
...                 Testes de atualização de produtos consumindo a API

Resource            ../../resources/services.robot

Suite Setup         Set Suite Var Auth Token      ${user_email}    ${user_pass}

***Test Cases***
Update a Product
    ${p_before}=     Get Json        update_before.json

    ${resp}=        Post Product    ${p_before}     before_remove
    Status Should Be        200     ${resp}

    ${product_id}   Convert To String       ${resp.json()['id']}

    ${p_after}=     Get Json        update_after.json

    ${resp}=        Put Product     ${product_id}   ${p_after}
    Status Should Be        204     ${resp}

    ${resp}=        Get Product     ${product_id}

    Should Be Equal     ${resp.json()['title']}     ${p_after['title']}
    
