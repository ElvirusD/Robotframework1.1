*** Settings ***
Library         SeleniumLibrary
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown     Close Browser
Suite Setup        Effacement des ficihiers



*** Test Cases ***
Passe plusieurs commandes
    Achat multi-produits            ${user_name}                ${passwrd}
