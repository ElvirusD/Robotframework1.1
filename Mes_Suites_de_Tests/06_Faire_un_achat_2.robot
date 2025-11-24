*** Settings ***
Library         SeleniumLibrary
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown     Close Browser
Suite Setup        Effacement des ficihiers


*** Test Cases ***
Passe une commandes 02
    Achat samsung            ${user_name}                ${passwrd}
