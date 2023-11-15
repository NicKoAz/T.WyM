import 'dart:io';

bool esPrimo(int numero) {
  if (numero <= 1) {
    return false;
  }
  for (int i = 2; i <= numero ~/ 2; i++) {
    if (numero % i == 0) {
      return false;
    }
  }
  return true;
}

bool esPar(int numero) {
  return numero % 2 == 0;
}

void verificarNumero(int numero) {
  if (esPrimo(numero)) {
    print('$numero es un número primo.');
  } else {
    print('$numero no es un número primo.');
  }

  if (esPar(numero)) {
    print('$numero es un número par.');
  } else {
    print('$numero es un número impar.');
  }
}

void main() {
  stdout.write('Ingrese un número: ');
  int numero = int.parse(stdin.readLineSync()!);
  verificarNumero(numero);
}
