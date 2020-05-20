***Settings***
Documentation       Aqui teremos todas a palavras chaves de ajuda

Library     OperatingSystem

***Keywords***
Get Json
    [Arguments]     ${json_file}

    ${string_file}=       Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${json_object}=       Evaluate    json.loads($string_file)     json

    [return]    ${json_object}