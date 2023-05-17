*** Settings ***
Resource    ../main.robot

*** Variables ***

${CAMPO_NOME}    id:form-nome
${CAMPO_CARGO}   id:form-cargo
${CAMPO_IMAGE}   id:form-imagem
${CAMPO_TIME}    class:lista-suspensa
${CAMPO_CARD}    id:form-botao
@{selecionar_times}
...     //option[contains(., 'Programação')]
...     //option[contains(., 'Front-End')]
...     //option[contains(., 'Data Science')]
...     //option[contains(., 'Devops')]
...     //option[contains(., 'UX e Design')]
...     //option[contains(., 'Mobile')]
...     //option[contains(., 'Inovação')]

*** Keywords ***

Dado que preencha os campos do formulario

    ${Nome}    FakerLibrary.First Name
    ${Cargo}   FakerLibrary.Job
    ${Img}     FakerLibrary.Image Url     width=100    height=100

    Input Text       ${CAMPO_NOME}     ${Nome}
    Input Text       ${CAMPO_CARGO}    ${Cargo}
    Input Text       ${CAMPO_IMAGE}    ${Img}
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[0]

E clique no botão criar card
    Click Element    ${CAMPO_CARD}


Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador


Então identificar 3 cards no time esperado
    FOR   ${i}     IN     RANGE     1    3
        Dado que preencha os campos do formulario
        E clique no botão criar card
    END
        Sleep    10s

Então criar e identificar um card em cada time disponível
    FOR    ${indice}    ${time}     IN ENUMERATE    @{selecionar_times}
        Dado que preencha os campos do formulario
        Click Element    ${time}
        E clique no botão criar card
    END
        Sleep    10s

Dado que eu clique no botão criar card
    Click Element     ${CAMPO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro