function verificarContraseña() {
    var contraseña = prompt("Ingrese su contraseña:");

    // Función para verificar si la contraseña cumple con los criterios
    function contraseñaValida(contraseña) {
        // Comprueba la longitud de la contraseña
        if (contraseña.length >= 8) {
            // Comprueba si contiene al menos una letra mayúscula
            if (/[A-Z]/.test(contraseña)) {
                // Comprueba si contiene al menos un número
                if (/\d/.test(contraseña)) {
                    // Comprueba si contiene al menos un carácter especial
                    if (/[!@#$%^&*()_+{}[\]:;<>,.?~\\-]/.test(contraseña)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    // Verifica si la contraseña ingresada es válida
    if (contraseñaValida(contraseña)) {
        alert("La contraseña es válida.");
    } else {
        var intentarNuevamente = confirm("La contraseña no cumple con los criterios de seguridad. ¿Desea intentar nuevamente?");

        if (intentarNuevamente) {
            verificarContraseña(); // Llama a la función nuevamente para intentar otra contraseña.
        } else {
            alert("Contraseña Valida");
        }
    }
}

verificarContraseña();
