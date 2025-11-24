*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Suite Teardown    Close All Browsers
Suite Setup        Effacement des ficihiers
#Test Tags          Robot:skip
*** Variables ***
${site_web}        https://www.demoblaze.com/index.html
${user_name}        Clemsong228
${passwrd}          Clement3@
${Wrg_passwrd}      Wrongpassword
${new_username}     Test_user1985
${pays}             France
${ville}            Lyon
${Ma_CB}         45126378978
${Mois_expi}        09
${year_expi}        2035

*** Test Cases ***
Inscription valide
    #[Tags]                        robot:skip
    Test Inscription                ${new_username}                 ${passwrd}
Authentification valide
   #[Tags]                        robot:skip
    Test connexion valide            ${user_name}                   ${passwrd}
Authentification non valide
      #[Tags]                     robot:skip
    Test connexion valide            ${user_name}                    ${Wrg_passwrd}
Inscription non valide
    #[Tags]                         robot:skip
    Test inscription invalide        ${user_name}                    ${passwrd}
Deconnexion
    #[Tags]                        robot:skip
    Test de deconnexion            ${user_name}                       ${passwrd}
Faire un achat
    #[Tags]                        robot:skip
    Achat mac_book                ${user_name}                        ${passwrd}
Faire un achat 2
     #[Tags]                    robot:skip
    Achat samsung                 ${user_name}                        ${passwrd}

Effectuer plusieurs Achats
    Achat multi-produits        ${user_name}                        ${passwrd}

Effacer les articles du Panier
    Vider mon panier            ${new_username}                        ${passwrd}







*** Keywords ***
Test Inscription
    [Arguments]                     ${new_username}                    ${passwrd}
    Open Browser                    ${site_web}
    Page Should Contain             PRODUCT STORE
    Click Element                   //*[@id="signin2"]
    Sleep                            0.5s
    Page Should Contain             Sign up
    Clear Element Text              id=sign-username
    Input Text                      sign-username                   ${new_username}
    Clear Element Text              id=sign-password
    Input Password                  sign-password                    ${passwrd}
    Click Button                    //*[@id="signInModal"]/div/div/div[3]/button[2]
   # ${alerte}                        Handle Alert                        ACCEPT
   # Should Be Equal As Strings        ${alerte}                         Sign up successful.
    #Page Should Contain           Sign up successful.
Test connexion valide
    [Arguments]                     ${user_name}                        ${passwrd}
    Open Browser                    ${site_web}
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
    [Arguments]                          ${user_name}                          ${Wrg_passwrd}
    Test connexion valide                ${user_name}                           ${Wrg_passwrd}
    Page Should Contain            Wrong password.

Test inscription invalide
    [Arguments]                  ${user_name}                           ${passwrd}
    Test Inscription             ${user_name}                        ${passwrd}
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
   # FOR   ${Dlete}   in ran       {deletes}
        #Log    ${Delete}
        #Click Element    ${Delete}
    #END
    #Click Element    xpath=//a[text()="Cart"]
    #Wait Until Element Is Visible    id=tbodyid    5s



















Effacement des ficihiers
    Remove File        geckodriver-*.log
    Remove File        selenium-screenshot-*.png
#Lire Popup
#   Wait Until Keyword Succeeds    10x    1s    Handle Alert    ACCEPT
#   ${msg}=    Handle Alert    ACCEPT
#  [Return]    ${msg}