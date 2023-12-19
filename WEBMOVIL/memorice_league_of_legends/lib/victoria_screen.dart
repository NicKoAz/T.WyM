import 'package:flutter/material.dart';

class VictoriaScreen extends StatelessWidget {
  final int tiempo; // Agrega el parámetro tiempo

  VictoriaScreen({required this.tiempo}); // Modifica el constructor para aceptar tiempo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/VICTORIA.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            '¡Has ganado en ${tiempo / 1000} segundos!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
