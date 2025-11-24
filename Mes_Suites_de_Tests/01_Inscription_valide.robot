*** Settings ***
Library         SeleniumLibrary
Resource        ../My_ressources/Keywords.robot
Resource        ../My_ressources/variables.robot
Suite Teardown   Close Browser

*** Test Cases ***
User SignIn
    [Template]                  Test Inscription
    ${user_name}                ${passwrd}
    ${username1}                ${mdp1}
    ${username2}                ${mdp2}
