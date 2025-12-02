*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Library          OperatingSystem
Suite Teardown   Close Browser
Suite Setup      Effacement des ficihiers

*** Test Cases ***
User LogIn toi
    [Template]                     Test connexion valide
    ${user_name}                    ${passwrd}
    ${username1}                    ${mdp1}
    ${username2}                    ${mdp2}

