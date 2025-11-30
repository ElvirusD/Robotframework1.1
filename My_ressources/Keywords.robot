*** Settings ***
Resource     ../My_ressources/variables.robot
#Resource     ../Mes ressources/Locator.robot
Library        SeleniumLibrary
Library        OperatingSystem




*** Keywords ***
Test Inscription
    [Arguments]                     ${user_name}                    ${passwrd}
    Open Browser                    ${site_web}                     options=options=add_argument("--headless")
    Page Should Contain             PRODUCT STORE
    Click Element                   //*[@id="signin2"]
    Sleep                            0.5s
    Page Should Contain             Sign up
    Clear Element Text              id=sign-username
    Input Text                      sign-username                   ${user_name}
    Clear Element Text              id=sign-password
    Input Password                  sign-password                    ${passwrd}
    Click Button                    //*[@id="signInModal"]/div/div/div[3]/button[2]
    #${alerte}                        Handle Alert                       ACCEPT
    #Should Be Equal As Strings        ${alerte}                         Sign up successful.
    #Page Should Contain           Sign up successful.
Test connexion valide
    [Arguments]                     ${user_name}                        ${passwrd}
    Open Browser                    ${site_web}                         options=options=add_argument("--headless")
    Page Should Contain             PRODUCT STORE
    Click Element                   id=login2
    Sleep                           3s
    Page Should Contain             Close
    Clear Element Text              id=loginusername
    Input Text                      loginusername                       ${user_name}
    Clear Element Text              id=loginpassword
    Input Password                  loginpassword                        ${passwrd}
    Click Button                    //*[@id="logInModal"]/div/div/div[3]/button[2]
    Page Should Contain             CATEGORIES

Test connexion invalide
    [Arguments]                          ${user_name}                           ${Wrg_passwrd}
    Test connexion valide                ${user_name}                           ${Wrg_passwrd}
    Sleep                                5s
    ${alerte}                        Handle Alert                            ACCEPT
    Should Be Equal As Strings        ${alerte}                              Wrong password.
    #Page Should Contain            Wrong password.

Test Inscription Invalide 1
       [Arguments]                      ${user_name}                            ${passwrd}
        Open Browser                    ${site_web}                             options=options=add_argument("--headless")
        Page Should Contain             PRODUCT STORE
        Click Element                   //*[@id="signin2"]
        Sleep                           0.5s
        Page Should Contain             Sign up
        Clear Element Text              id=sign-username
        Sleep                           2s
        Click Button                    //*[@id="signInModal"]/div/div/div[3]/button[2]
        ${alerte}                    Handle Alert                    ACCEPT
        Should Be Equal As Strings        ${alerte}                 Please fill out Username and Password.

Test inscription invalide
    [Arguments]                  ${user_name}                           ${passwrd}
    Test Inscription             ${user_name}                           ${passwrd}
    Sleep                        3s
    ${alert}                    Handle Alert                    ACCEPT
    Should Be Equal As Strings    ${alert}                      This user already exist.
    #Page Should Contain          This user already exist.
Test de deconnexion
    [Arguments]                    ${user_name}                        ${password}
    Test connexion valide          ${user_name}                        ${password}
    sleep                           5s
    Click Link                      //*[@id="logout2"]
    Page Should Contain            CATEGORIES

Place order info
    Click Button                    //*[text()="Place Order"]
    Page Should Contain               Place order
    Wait Until Element Is Visible     id=name
    Clear Element Text                //*[@id="name"]
    Input Text                        id=name                        ${user_name}
    Clear Element Text                id=country
    Input Text                        id=country                      ${pays}
    Clear Element Text                id=city
    Input Text                        id=city                         ${ville}
    Clear Element Text                id=card
    Input Text                        id=card                         ${Ma_CB}
    Clear Element Text                id=month
    Input Text                        id=month                        ${Mois_expi}
    Clear Element Text                id=year
    Input Text                        id=year                         ${year_expi}
    Sleep                              2s
    Click Button                     //*[@id="orderModal"]/div/div/div[3]/button[2]
    Page Should Contain               Thank you for your purchase!

Voir mon panier
    Click Link            //*[@id="cartur"]
    Page Should Contain        Products


Achat mac_book
    [Arguments]                  ${user_name}                            ${password}
    Test connexion valide       ${user_name}                            ${password}
    Sleep                        4s
    Click Button                //*[@id="next2"]
    Sleep                        4s
    Click Element               //*[@id="tbodyid"]/div[6]/div/div/h4/a
    #Element Should Be Visible         //*[@id="tbodyid"]/h2
    #Page Should Contain Button        //a[text()="Add to cart"]
    Sleep                        2s
    Click Element                //a[text()="Add to cart"]
    ${alert}                Handle Alert                    ACCEPT
    Should Be Equal As Strings    ${alert}                  Product added.
    #Page Should Contain           Product added
    Voir mon panier
    Place order info
Achat samsung
    [Arguments]                    ${user_name}                            ${password}
    Test connexion valide          ${user_name}                            ${password}
    Sleep                           2s
    Click Element                   //*[@id="tbodyid"]/div[1]/div/div/h4/a
    Sleep                            2s
    Click Element                   //a[text()="Add to cart"]
    ${alert}                Handle Alert                    ACCEPT
    Should Be Equal As Strings    ${alert}                  Product added.
    Voir mon panier
    Place order info

Home page
     Click Link                         //*[@id="navbarExample"]/ul/li[1]/a

Achat multi-produits
    [Arguments]                    ${user_name}                            ${password}
    Test connexion valide          ${user_name}                            ${password}
    sleep                          2s
    Click Element                  //*[@id="tbodyid"]/div[3]/div/div/h4/a
    Sleep                          2s
    Click Element                   //a[text()="Add to cart"]   # A utiliser en cas d'echec
    ${alerte}                         Handle Alert                    ACCEPT
    Should Be Equal As Strings        ${alerte}                       Product added.
    Home page
    Sleep                           2s
    Click Element                   //*[@id="tbodyid"]/div[1]/div/div/h4/a
    Sleep                            2s
    Click Element                   //a[text()="Add to cart"]
    ${alert}                Handle Alert                    ACCEPT
    Should Be Equal As Strings    ${alert}                  Product added.
    Home page
    Sleep                            2s
    Click Element                //*[@id="tbodyid"]/div[2]/div/div/h4/a
    sleep                         2s
    Click Element                //a[text()="Add to cart"]
    ${alerte}              Handle Alert                    ACCEPT
    Should Be Equal As Strings        ${alert}               Product added.
    Home page
    Sleep                         2s
    Click Element                 //*[@id="tbodyid"]/div[7]/div/div/h4/a
    Sleep                         2s
    Click Element                //a[text()="Add to cart"]
    ${alerte}                Handle Alert                      ACCEPT
    Should Be Equal As Strings        ${alerte}                Product added.
    Home page
    sleep                          2s
    Click Element                 //*[@id="tbodyid"]/div[8]/div/div/h4/a
    Sleep                          2s
    Click Element                //a[text()="Add to cart"]
    ${alerte}                     Handle Alert                        ACCEPT
    Should Be Equal As Strings    ${alerte}                      Product added.
    Home page
    Voir mon panier
    Place order info
    Sleep                        2s

Vider mon panier
    [Arguments]                    ${user_name}                            ${password}
    Test connexion valide          ${user_name}                            ${password}
    sleep                          2s
    Click Element                  //*[@id="tbodyid"]/div[3]/div/div/h4/a
    Sleep                          2s
    Click Element                   //a[text()="Add to cart"]   # A utiliser en cas d'echec
    ${alerte}                         Handle Alert                    ACCEPT
    Should Be Equal As Strings        ${alerte}                       Product added.
    Home page
    Sleep                           2s
    Click Element                   //*[@id="tbodyid"]/div[1]/div/div/h4/a
    Sleep                            2s
    Click Element                   //a[text()="Add to cart"]
    ${alert}                Handle Alert                    ACCEPT
    Should Be Equal As Strings    ${alert}                  Product added.
    Home page
    Sleep                            2s
    Click Element                //*[@id="tbodyid"]/div[2]/div/div/h4/a
    sleep                         2s
    Click Element                //a[text()="Add to cart"]
    ${alerte}              Handle Alert                    ACCEPT
    Should Be Equal As Strings        ${alert}               Product added.
    Home page
    Sleep                         2s
    Click Element                 //*[@id="tbodyid"]/div[7]/div/div/h4/a
    Sleep                         2s
    Click Element                //a[text()="Add to cart"]
    ${alerte}                Handle Alert                      ACCEPT
    Should Be Equal As Strings        ${alerte}                Product added.
    Home page
    sleep                          2s
    Click Element                 //*[@id="tbodyid"]/div[8]/div/div/h4/a
    Sleep                          2s
    Click Element                //a[text()="Add to cart"]
    ${alerte}                     Handle Alert                        ACCEPT
    Should Be Equal As Strings    ${alerte}                      Product added.
    Home page
    Voir mon panier
    ${deletes}=               Get Element Count         //*[@id="tbodyid"]//a[text()="Delete"]
    FOR    ${index}    IN RANGE    ${deletes}
        Click Element    xpath=(//*[@id="tbodyid"]//a[text()="Delete"])[1]
        Sleep    1s
    END

Effacement des ficihiers
    Remove File        geckodriver-*.log
    Remove File        selenium-screenshot-*.png