*** Settings ***
Library         SeleniumLibrary
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown     Close Browser
Suite Setup        Effacement des ficihiers

*** Test Cases ***
User SignIn Invalid

    Test inscription invalide            ${user_name}                   ${passwrd}
    Test Inscription Invalide 1          ${user_name}                    ${passwrd}
