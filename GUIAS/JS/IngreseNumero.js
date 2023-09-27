// Solicitamos al usuario un número entero positivo
var numero = parseInt(prompt("Por favor, ingrese un número entero positivo:"));

// Verificamos si el número es válido (mayor que 0)
if (numero > 0) {
  var suma = 0;

  // Utilizamos un ciclo para calcular la suma de los números pares
  for (var i = 2; i <= numero; i += 2) {
    suma += i;
  }

  // Mostramos el resultado en el navegador
  document.write("La suma de todos los números pares desde 1 hasta " + numero + " es: " + suma);
} else {
  document.write("Por favor, ingrese un número entero positivo válido.");
}
