function encontrarNumeroMasGrande() {
    var numerosTexto = prompt("ingrese una serie de números separados por comas( , ):");

    if (/[.\-\/]/.test(numerosTexto) || /,.*,/.test(numerosTexto)) {
        alert("ERROR: Los números solo deben ser separados por comas (',').");
        encontrarNumeroMasGrande(); 
        return; 
    }

    var numeros = numerosTexto.split(",");

    numeros = numeros.map(function(numero) {
        return numero.trim();
    });

    var numerosValidos = numeros.filter(function(numero) {
        return !isNaN(numero);
    }).map(function(numero) {
        return parseFloat(numero);
    });

    if (numerosValidos.length > 0) {
        var numeroMasGrande = Math.max.apply(null, numerosValidos);

        alert("Números ingresados: " + numerosValidos.join(", ") + "\nNúmero más grande: " + numeroMasGrande);
    } else {
        alert("No se ingresaron números válidos.");
    }
}

encontrarNumeroMasGrande();
