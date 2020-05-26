***Settings***
Documentation       POST /auth
...                 Testes do serviço de autorização (Authentication Token)

Resource            ../../resources/services.robot

***Test Cases***
Successfuly Login
    [tags]      success

    ${resp}=        Post Token      papito@ninjapixel.com    pwd123
    Status Should Be        201     ${resp}

Incorrect Password
    [tags]      not_authorized
    
    ${resp}=        Post Token      papito@ninjapixel.com   abc123
    Status Should Be        401     ${resp}

