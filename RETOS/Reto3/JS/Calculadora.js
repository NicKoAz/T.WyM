function calcularPropina() {
    var montoBoletaInput = document.getElementById("montoBoleta");
    var porcentajePropinaInput = document.getElementById("porcentajePropina");
    var resultadoDiv = document.getElementById("resultado");

    var montoBoleta = montoBoletaInput.value.trim(); 

    if (!montoBoleta.match(/^\d+$/)) {
        resultadoDiv.innerHTML = "Error: Ingrese solo números enteros para poder calcular.";
        return;
    }

    montoBoleta = parseInt(montoBoleta, 10);
    var porcentajePropina = parseFloat(porcentajePropinaInput.value);

    if (isNaN(montoBoleta) || isNaN(porcentajePropina)) {
        resultadoDiv.innerHTML = "Error: Ingrese solo números enteros para poder calcular.";
        return;
    }

    var propina = (montoBoleta * porcentajePropina) / 100;
    var totalAPagar = montoBoleta + propina;

    resultadoDiv.innerHTML = "Propina: CLP " + propina.toFixed(2) + "<br>Total a Pagar (con propina): CLP " + totalAPagar.toFixed(2);
}
