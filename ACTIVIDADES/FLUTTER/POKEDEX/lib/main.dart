import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Carousel Slider Example'),
        ),
        body: PokemonCarousel(),
      ),
    );
  }
}

class PokemonCarousel extends StatelessWidget {
  final List<Widget> pokemonCards = [
    PokemonCard('Bulbasaur', 'Planta', 'assets/bulbasaur.png', 1),
    PokemonCard('Charmander', 'Fuego', 'assets/charmander.png', 4),
    PokemonCard('Squirtle', 'Agua', 'assets/squirtle.png', 7),
    // Agrega más tarjetas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: pokemonCards,
    );
  }
}

class PokemonCard extends StatelessWidget {
  final String name;
  final String type;
  final String imagePath;
  final int pokedexNumber;

  PokemonCard(this.name, this.type, this.imagePath, this.pokedexNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, height: 120.0),
          ListTile(
            title: Text(name),
            subtitle: Text('Tipo: $type\nPokedex #: $pokedexNumber'),
          ),
        ],
      ),
    );
  }
}
