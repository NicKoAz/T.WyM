function verificarContraseña() {
    var contraseña = prompt("Ingrese su contraseña:");

    function contraseñaValida(contraseña) {
        if (contraseña.length >= 8) {
            if (/[A-Z]/.test(contraseña)) {
                if (/\d/.test(contraseña)) {
                    if (/[!@#$%^&*()_+{}[\]:;<>,.?~\\-]/.test(contraseña)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    if (contraseñaValida(contraseña)) {
        alert("La contraseña es válida.");
    } else {
        var intentarNuevamente = confirm("La contraseña no cumple con los criterios de seguridad. ¿Desea intentar nuevamente?");

        if (intentarNuevamente) {
            verificarContraseña();
        } else {
            alert("Contraseña Valida");
        }
    }
}

verificarContraseña();
