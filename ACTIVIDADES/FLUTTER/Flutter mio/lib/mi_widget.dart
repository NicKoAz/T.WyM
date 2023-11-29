// lib/mi_widget.dart

// Importar el paquete necesario para Flutter
import 'package:flutter/material.dart';

// Definir una clase que representa el nuevo widget
class MiWidget extends StatelessWidget {
  // Método build para construir la interfaz gráfica del widget
  @override
  Widget build(BuildContext context) {
    // Devolver un Scaffold que contiene la estructura básica de la pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Widget'), // Título de la pantalla
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Primer Card con imagen y descripción
          Card(
            child: Column(
              children: [
                Image.network('URL_DE_LA_IMAGEN_1'), // Imagen desde URL
                ListTile(
                  title: Text('Descripción 1'), // Descripción asociada a la imagen
                ),
              ],
            ),
          ),
          // Otros Cards similares para las siguientes imágenes y descripciones
          // ...

          // Botón para redirigir a la página de Ulagos
          ElevatedButton(
            onPressed: () {
              // Acciones al hacer clic en el botón
              // Puedes utilizar Navigator para la navegación a otras pantallas
            },
            child: Text('Ir a Ulagos'), // Texto del botón
          ),
        ],
      ),
    );
  }
}
