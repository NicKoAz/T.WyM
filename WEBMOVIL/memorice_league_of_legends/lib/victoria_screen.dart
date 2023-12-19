import 'package:flutter/material.dart';
import 'modo_facil_screen.dart';
import 'modo_medio_screen.dart';
import 'modo_dificil_screen.dart';
import 'introduction_screen.dart';

class VictoriaScreen extends StatelessWidget {
  final int tiempo;
  final String nombreUsuario;
  final String modoJuego;
  static List<String> usuarios = [];
  static List<int> tiempos = [];
  static List<String> modosJuego = [];

  VictoriaScreen({
    required this.tiempo,
    required this.nombreUsuario,
    required this.modoJuego,
  }) {
    usuarios.add(nombreUsuario);
    tiempos.add(tiempo);
    modosJuego.add(modoJuego);
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Tus Mejores Tiempos',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,)
                ),
              ),
              SizedBox(height: 80),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Nombre:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          // Utiliza ListView.builder para mostrar la lista
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: usuarios.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  '${usuarios[index]}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Tiempo:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          // Utiliza ListView.builder para mostrar la lista
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: tiempos.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  '${(tiempos[index] / 1000).round()} s',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Modo:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          // Utiliza ListView.builder para mostrar la lista
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: modosJuego.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  '${modosJuego[index]}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Redirige a la pantalla IntroductionScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IntroductionScreen()),
                  );
                },
                child: Text('Volver a Jugar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
