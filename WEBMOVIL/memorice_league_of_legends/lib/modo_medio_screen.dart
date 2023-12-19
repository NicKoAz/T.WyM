import 'package:flutter/material.dart';

class ModoMedioScreen extends StatelessWidget {
  final String nombreUsuario;

  ModoMedioScreen(this.nombreUsuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/MODOSDEJUEGOS.jpg'), // Imagen de Fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            '¡Bienvenido al Modo Medio, $nombreUsuario!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}