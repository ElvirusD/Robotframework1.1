*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown   Close All Browsers
Suite Setup      Effacement des ficihiers


*** Test Cases ***
User logIN invalide
    Test connexion invalide            ${user_name}                ${Wrg_passwrd}