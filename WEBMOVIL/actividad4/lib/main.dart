import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MiPagina(),
    );
  }
}

class MiPagina extends StatefulWidget {
  @override
  _MiPaginaState createState() => _MiPaginaState();
}

class _MiPaginaState extends State<MiPagina> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [
    MiCarrusel(),
    MiPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Carrusel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class MiCarrusel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        items: <Widget>[
          Container(
            color: Colors.red,
            child: Center(child: Text('Elemento 1')),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Elemento 2')),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text('Elemento 3')),
          ),
        ],
        options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}

class MiPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/perfil1.jpg'),
            child: Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Acciones al presionar el botón de editar perfil
            },
            child: Text('Editar Perfil'),
          ),
        ],
      ),
    );
  }
}
