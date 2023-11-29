class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HolaMundo'),
        ),
        body: Center(
        child: ElevatedButton(
        onPressed: () {
      // Esta función se ejecutará al presionar el botón
      print('¡Hola Mundo!');
    },
    child: Text('Presiona'),
    ),
    ),
    );
  }
}
