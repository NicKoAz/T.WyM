function contarPalabras() {
    var oracion = prompt("Ingrese una oración:");

    if (oracion !== null && oracion.trim() !== "") {
        if (!/\d/.test(oracion)) {
            var palabras = oracion.split(/\s+/);

            alert("Oración ingresada: " + oracion + "\nNúmero de palabras: " + palabras.length);
        } else {
            alert("Incorrecto, solo ingrese palabras.");
            contarPalabras(); 
        }
    } else {
        alert("No ingresó una oración válida.");
    }
}

contarPalabras();
