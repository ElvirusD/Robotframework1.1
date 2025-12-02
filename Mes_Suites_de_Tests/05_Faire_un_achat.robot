*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown    Close Browser
Suite Setup        Effacement des ficihiers

*** Test Cases ***
Passe une commande
    Achat mac_book            ${user_name}                ${passwrd}
