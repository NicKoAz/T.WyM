import 'package:flutter/material.dart';
import 'modo_facil_screen.dart';
import 'modo_medio_screen.dart';
import 'modo_dificil_screen.dart';

class DifficultySelectionScreen extends StatelessWidget {
  final String nombreUsuario;

  DifficultySelectionScreen({required this.nombreUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/SELECCIONDEMODOS.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Bienvenido $nombreUsuario',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.grey.withOpacity(0.5),
                        child: Text(
                          'Seleccione dificultad',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ModoFacilScreen(nombreUsuario)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        ),
                        child: Text('Fácil', style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      SizedBox(height: 15), // Espacio vertical entre botones
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ModoMedioScreen(nombreUsuario)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        ),
                        child: Text('Medio', style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      SizedBox(height: 15), // Espacio vertical entre botones
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ModoDificilScreen(nombreUsuario)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        ),
                        child: Text('Difícil', style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
