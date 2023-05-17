*** Settings ***


Resource         ../resource/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador


*** Test Cases ***
Verificar se ao preencheer os campos do formulario corretamente os dados são inseridos na lista e se um novo card é criado no time esperado

    Dado que preencha os campos do formulario
    E clique no botão criar card
    Então identificar o card no time esperado


Verificar se é possível criar mais de um card se preencher os campos corretamente
    Dado que preencha os campos do formulario
    E clique no botão criar card
    Então identificar 3 cards no time esperado

Verificar se é possível criar um card para cada time disponivel se preencher os campos corretamente
    Dado que preencha os campos do formulario
    Então criar e identificar um card em cada time disponível



