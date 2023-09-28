function contarPalabras() {
    var oracion = prompt("Por favor, ingrese una oración:");

    if (oracion !== null && oracion.trim() !== "") {
        // Verificar si la oración contiene números
        if (!/\d/.test(oracion)) {
            var palabras = oracion.split(/\s+/);

            alert("Oración ingresada: " + oracion + "\nNúmero de palabras: " + palabras.length);
        } else {
            alert("Incorrecto, solo ingrese palabras.");
            contarPalabras(); // Llama a la función nuevamente para intentar con una nueva entrada.
        }
    } else {
        alert("No ingresó una oración válida.");
    }
}

contarPalabras();
