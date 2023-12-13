import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memorice de Campeones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameModeSelection()),
            );
          },
          child: Text('Juguemos'),
        ),
      ),
    );
  }
}

class GameModeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona el Modo de Juego'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Lógica para iniciar el juego en modo fácil
            },
            child: Text('Fácil'),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para iniciar el juego en modo medio
            },
            child: Text('Medio'),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para iniciar el juego en modo difícil
            },
            child: Text('Difícil'),
          ),
          // Aquí puedes agregar la sección de mejores puntajes
        ],
      ),
    );
  }
}
