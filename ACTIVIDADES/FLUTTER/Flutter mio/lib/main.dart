// lib/main.dart

import 'package:flutter/material.dart';
import 'mi_widget.dart'; // Importar el archivo mi_widget.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MiWidget(), // Llamar al widget creado
    );
  }
}