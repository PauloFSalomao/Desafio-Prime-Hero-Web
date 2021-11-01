*** Settings ***
Documentation       Aqui estarão presentes os testes Web do curso Prime Hero
...                 A ideia é criar cenários de verificações com a library Selenium

Library             SeleniumLibrary

#robot desafioweb3.robot

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

Acessar a página home do site
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Passar o mouse por cima da categoria ${CATEGORIA} no menu principal superior de categorias
    Mouse Over          xpath=//*[@id="block_top_menu"] //*[@title="Women"]

Clicar na sub-categoria "${SUBCATEGORIA}"
    Click Element        xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a


Conferir se os produtos da sub-categoria ${SUBCATEGORIA} foram mostrados na página
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/h1/span[2]
    Page Should Contain Image           xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    Title Should Be                     Summer Dresses - My Store
 

*** Test Cases ***

Caso de Teste 03: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub-categoria "Summer Dresses"
	Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página