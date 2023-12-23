<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../css/registration.css" />
</head>
<body>
<form id="registrationForm" action="../registration" method="post">
    <div class="element-registration">
        <div class="div">
            <p class="hai-gi-un-account">
                <span class="text-wrapper">Hai gia' un account?</span>
                <span class="span">&nbsp;</span>
                <span class="text-wrapper-2">Login</span>
            </p>
            <button class="button" type="submit" value="Sign Up" id="signUpButton"><div class="text-wrapper-3">Sign Up</div></button>
            <div class="input-fields">
                <div class="input-3">
                    <input class="text-wrapper-4" type="text" id="pin" placeholder="Inserisci il PIN o Licenza" pattern="\b(\d{4}|\d{8})\b" title="Devi inserire un numero di 4 o 8 cifre" required>
                    <img class="img" src="../images/registration/icon-user-outline.svg" />
                </div>
                <div class="input-2">
                    <input class="text-wrapper-4" type="text" id="cognome" placeholder="Il tuo cognome" pattern="^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$" title="Il cognome deve contenere solo lettere, spazi, trattini, apostrofi e accenti." required >
                    <img class="img" src="../images/registration/icon-user-outline.svg" />
                </div>
                <div class="input">
                    <input class="text-wrapper-4" type="text" id="nome" placeholder="Il tuo nome" pattern="^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$" title="Il nome deve contenere solo lettere, spazi, trattini, apostrofi e accenti." required >
                    <img class="img" src="../images/registration/icon-user-outline.svg" />
                </div>
                <div class="input-4">
                    <input class="text-wrapper-4" type="email" id="email" placeholder="La tua e-mail" required >
                    <img class="img" src="../images/registration/icon-email.svg" />
                </div>
                <div class="input-5">
                    <input class="text-wrapper-4" type="password" id="password" placeholder="La tua password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{12,}" title="La password deve contenere almeno un numero, una lettera maiuscola e una minuscola, e deve avere almeno 12 caratteri." required >
                    <img class="icon-eye-slash" src="../images/registration/icon-eye-slash.svg" />
                    <img class="img" src="../images/registration/icon-password.svg" />
                </div>
                <div class="terms-of-service">
                    <p class="accetto-al">
                        <span class="text-wrapper-5">Accetto i seguenti </span>
                        <span class="text-wrapper-6">Termini di Servizio</span>
                        <span class="text-wrapper-5"> di TalkAId e policy sulla </span>
                        <span class="text-wrapper-6">Privacy</span>
                    </p>
                    <input type="checkbox" class="checkbox" id="myCheckbox" style="display: none;" required />
                    <label for="myCheckbox">
                        <img class="checkbox" src="../images/registration/checkbox.svg" />
                    </label>
                </div>
            </div>
            <div class="top-bar">
                <div class="top"><div class="text-wrapper-7">Registrati</div></div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
