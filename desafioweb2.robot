*** Settings ***
Documentation       Aqui estarão presentes os testes Web do curso Prime Hero
...                 A ideia é criar cenários de verificações com a library Selenium

Library             SeleniumLibrary
#robot desafioweb2.robot
Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador

*** Variables ***
${URL}           http://automationpractice.com/index.php
${BROWSER}       chrome


*** Keywords ***
Abrir Navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser

Acessar a página home do site Automation Practice
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text          id=search_query_top         ${PRODUTO}

Clicar no botão pesquisar
    Click Element       xpath=//*[@name='submit_search' and @type='submit']                 

Conferir mensagem "${MENSAGEMDEALERTA}"
    Wait Until Element Is Visible       xpath=//*[@id='center_column'] //*[@class='alert alert-warning']
    Element Text Should Be              xpath=//*[@id='center_column'] //*[@class='alert alert-warning']      ${MENSAGEMDEALERTA}
					

*** Test Cases ***
Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""