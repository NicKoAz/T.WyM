import 'dart:async';
import 'package:flutter/material.dart';
import 'victoria_screen.dart';

class ModoMedioScreen extends StatefulWidget {
  final String nombreUsuario;

  ModoMedioScreen(this.nombreUsuario);

  @override
  _ModoMedioScreenState createState() => _ModoMedioScreenState();
}

class _ModoMedioScreenState extends State<ModoMedioScreen> {
  List<String> listaCartas = [
    'assets/CHAMPS/campeon1.png',
    'assets/CHAMPS/campeon2.png',
    'assets/CHAMPS/campeon3.png',
    'assets/CHAMPS/campeon4.png',
    'assets/CHAMPS/campeon5.png',
    'assets/CHAMPS/campeon6.png',
    'assets/CHAMPS/campeon7.png',
    'assets/CHAMPS/campeon8.png'
  ];

  List<String> cartasVolteadas = [];
  List<bool> cartasVisibles = [];
  bool juegoIniciado = false;
  Stopwatch cronometro = Stopwatch();
  late Timer timer;

  @override
  void initState() {
    super.initState();
  }

  void iniciarJuego() {
    // Restablece el cronómetro al iniciar un nuevo juego
    cronometro.reset();

    // Duplica las cartas para formar pares
    List<String> cartasDuplicadas = List.from(listaCartas);
    listaCartas.clear(); // Limpia la lista antes de agregar nuevas cartas
    listaCartas.addAll([...cartasDuplicadas, ...cartasDuplicadas]); // Duplica y agrega las cartas nuevamente
    // Baraja las cartas
    listaCartas.shuffle();
    // Inicializa la visibilidad de las cartas
    cartasVisibles = List.generate(listaCartas.length, (index) => true);
    // Inicia el cronómetro
    cronometro.start();

    // Actualiza la interfaz para mostrar el cronómetro y ocultar las cartas
    setState(() {
      juegoIniciado = true;
    });

    // Inicia un temporizador para actualizar el cronómetro cada segundo
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void voltearCarta(int index) {
    setState(() {
      if (cartasVolteadas.length < 2 && cartasVisibles[index]) {
        // Voltea la carta solo si no hay dos cartas ya volteadas
        cartasVolteadas.add(listaCartas[index]);
        cartasVisibles[index] = false; // Voltea la carta
        if (cartasVolteadas.length == 2) {
          // Compara las dos cartas volteadas después de un breve tiempo
          Future.delayed(Duration(seconds: 1), () {
            compararCartas();
          });
        }
      }
    });
  }

  void compararCartas() {
    setState(() {
      if (cartasVolteadas[0] == cartasVolteadas[1]) {
        // Si las cartas son iguales, las marca como encontradas
        for (int i = 0; i < listaCartas.length; i++) {
          if (listaCartas[i] == cartasVolteadas[0]) {
            cartasVisibles[i] = false;
          }
        }
      } else {
        // Si las cartas no son iguales, las voltea nuevamente después de un breve tiempo
        for (int i = 0; i < listaCartas.length; i++) {
          if (!cartasVisibles[i]) {
            cartasVisibles[i] = true;
          }
        }
      }
      // Limpia las cartas volteadas
      cartasVolteadas.clear();
    });

    // Verifica si todas las cartas han sido encontradas
    if (cartasVisibles.isEmpty || !cartasVisibles.contains(true)) {
      // Detiene el cronómetro y el temporizador
      cronometro.stop();
      timer.cancel();
      // Navega a la pantalla de victoria pasando el tiempo como argumento
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VictoriaScreen(tiempo: cronometro.elapsedMilliseconds, nombreUsuario: widget.nombreUsuario, modoJuego: 'Medio'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/MODOSDEJUEGOS.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Medio',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: listaCartas.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (juegoIniciado && cartasVisibles[index]) {
                          voltearCarta(index);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: cartasVisibles[index] ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: cartasVisibles[index]
                                ? AssetImage('assets/placeholder.jpg') // Imagen de respaldo para las cartas
                                : AssetImage(listaCartas[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            juegoIniciado
                ? Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Tiempo: ${cronometro.elapsed.inSeconds} segundos',
                style: TextStyle(color: Colors.white),
              ),
            )
                : SizedBox(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!juegoIniciado) {
                  iniciarJuego();
                } else {
                  // Si el juego ya ha comenzado, muestra un mensaje
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('El juego ya ha comenzado.'),
                    ),
                  );
                }
              },
              child: Text('Iniciar Juego'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Cancela el temporizador al salir de la pantalla
    timer.cancel();
    super.dispose();
  }
}
