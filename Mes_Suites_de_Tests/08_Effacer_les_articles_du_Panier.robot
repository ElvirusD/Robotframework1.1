*** Settings ***
Library         SeleniumLibrary
Library          OperatingSystem
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown     Close Browser
Suite Setup        Effacement des ficihiers


*** Test Cases ***
vidons le panier
    Vider mon panier            ${user_name}                         ${passwrd}


