var numero = parseInt(prompt("Por favor, ingrese un número entero positivo:"));

if (numero > 0) {
  var suma = 0;

  for (var i = 2; i <= numero; i += 2) {
    suma += i;
  }

  document.write("La suma de todos los números pares desde 1 hasta " + numero + " es: " + suma);
} else {
  document.write("Por favor, ingrese un número entero positivo válido.");
}
