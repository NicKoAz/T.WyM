function calcularIMC() {
    var estaturaTexto = prompt("Ingrese su estatura en metros (use coma o punto como separador decimal):");
    var estatura = parseFloat(estaturaTexto.replace(",", ".")); 
    var peso = parseFloat(prompt("Ingrese su peso en kilogramos:"));

    if (!isNaN(estatura) && !isNaN(peso) && estatura > 0 && peso > 0) {
        var imc = peso / (estatura * estatura);
        var categoria = "";

        if (imc < 18.5) {
            categoria = "Bajo Peso";
        } else if (imc >= 18.5 && imc < 24.9) {
            categoria = "Peso Normal";
        } else {
            categoria = "Sobrepeso";
        }

        var tabla = document.querySelector('table');
        var fila = tabla.insertRow(-1); 
        var estaturaCelda = fila.insertCell(0);
        estaturaCelda.innerHTML = estatura.toFixed(2);

        var pesoCelda = fila.insertCell(1);
        pesoCelda.innerHTML = peso.toFixed(2);

        var imcCelda = fila.insertCell(2);
        imcCelda.innerHTML = imc.toFixed(2);

        var categoriaCelda = fila.insertCell(3);
        categoriaCelda.innerHTML = categoria;
    } else {
        alert("Ingrese valores válidos para estatura y peso.");
    }
}

function nuevaEntrada() {
    var tabla = document.querySelector('table');
    while (tabla.rows.length > 1) {
        tabla.deleteRow(1);
    }

    calcularIMC();
}
