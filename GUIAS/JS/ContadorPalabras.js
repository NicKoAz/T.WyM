function contarPalabras() {
    var oracion = prompt("Por favor, ingrese una oración:");

    if (oracion !== null && oracion.trim() !== "") {
        var palabras = oracion.split(/\s+/);

        alert("Oración ingresada: " + oracion + "\nNúmero de palabras: " + palabras.length);
    } else {
        alert("No ingresó una oración válida.");
    }
}
