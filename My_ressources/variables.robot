*** Variables ***
${site_web}        https://www.demoblaze.com/index.html
${user_name}        Clem01.
${username1}        Clem02.
${username2}        Clem02.
${username3}        Clem03
${passwrd}          Clement@
${Wrg_passwrd}      Wrongpassword
${new_username}     Retest_LogIn
${pays}             France
${ville}            LYON
${Ma_CB}         45126378978782514
${Mois_expi}        09
${year_expi}        2035

${mdp1}            Clement1
${mdp2}            Clement2
${mdp3}            Clement3

@{HEADLESS_OPTIONS}
...    add_argument("--headless")
...    add_argument("--no-sandbox")
...    add_argument("--disable-dev-shm-usage")