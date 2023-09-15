function verificarParOImpar() {
    let numeroInput = document.getElementById("numeroInput");
    let numero = parseInt(numeroInput.value);

    if (!isNaN(numero)) {
        if (numero % 2 === 0) {
            alert("El número es par");
        } else {
            alert("El número es impar");
        }
    } else {
        alert("Por favor, ingrese un valor válido.");
    }
}
