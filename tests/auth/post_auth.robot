***Settings***
Documentation       POST /auth
...                 Testes do serviço de autorização (Authentication Token)

Resource            ../../resources/services.robot

***Test Cases***
Successfuly Login
    ${payload}=     ????

    ${resp}=        Post Token     ${payload}
    Status Should Be        200     ${resp}

Incorrect Passoword
    ${payload}=     ????

    ${resp}=        Post Token     ${payload}
    Status Should Be        401     ${resp}

