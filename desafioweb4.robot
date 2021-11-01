*** Settings ***
Documentation       Aqui estarão presentes os testes Web do curso Prime Hero
...                 A ideia é criar cenários de verificações com a library Selenium

Library             SeleniumLibrary
Library             String
Library             FakerLibrary    locale=pt_BR

#robot desafioweb4.robot

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
    Close Browser

Acessar a página home do site
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       id=block_top_menu

Clicar em "Sign in"
    Click Element                       xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Wait Until Element Is Visible       xpath=//*[@id="columns"]/div[1]/span[2]
    Title Should Be                     Login - My Store

Informar um email válido
    ${nome}     Generate Random String      length=4        chars=[LETTERS][NUMBERS]
    Input Text                          id=email_create     teste${nome}@hotmail.com
    
Clicar em "Create an account"
    Click Element                       id=SubmitCreate
    Wait Until Element Is Visible       xpath=//*[@id="account-creation_form"]/div[1]/h3

Preencher campos obrigatórios
  Preencher campo         id=customer_firstname      Paulo
  Preencher campo         id=customer_lastname       Salomao
  Preencher campo         id=passwd                  123456
  Preencher campo         id=firstname               Paulo
  Preencher campo         id=lastname                Salomao
  Preencher campo         id=address1                Rua Teixeira, 100 - Centro
  Preencher campo         id=city                    Teixeira de Freitas
  Selecionar estado
  Preencher campo         id=postcode                00000 
  Preencher campo         id=phone_mobile            73999228901
  Preencher campo         id=alias                   Bahia

Preencher campo
  [Arguments]         ${locator}      ${valor}
  Input Text          ${locator}      ${valor}

Selecionar estado
  Set Selenium Speed  0.4
  Select From List By Value       id=id_state     6
  Set Selenium Speed  0

Submeter cadastro
    Click Element           id=submitAccount

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible           //*[@id="center_column"]/h1
    Title Should Be                         My account - My Store
 
*** Test Cases ***
Caso de Teste 04: Adicionar Cliente 
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um email válido
    Clicar em "Create an account"
    Preencher campos obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso