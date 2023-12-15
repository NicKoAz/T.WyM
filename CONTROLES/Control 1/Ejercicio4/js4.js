var monto = parseFloat(prompt("Ingrese monto para calcular factura:"));
var ivaInput = prompt("Ingrese el porcentaje de IVA (opcional, por defecto es 19%):");
var iva = ivaInput ? parseFloat(ivaInput) / 100 : 0.19; 
function calcularIVA(monto, iva) {
    return monto * iva;
}

var IVAdelMonto = calcularIVA(monto, iva);

function calcularTotalConIVA(monto, IVAdelMonto) {
    return monto + IVAdelMonto;
}

var total = calcularTotalConIVA(monto, IVAdelMonto);

console.log("El total con IVA es: " + total.toFixed(2));
