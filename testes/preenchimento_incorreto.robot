*** Settings ***

Resource         ../resource/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_CARD}        id:form-botao


*** Test Cases ***

Verificar se exibe erro de campo obrigatório não preenchido
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório