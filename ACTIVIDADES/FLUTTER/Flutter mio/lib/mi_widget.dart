// lib/mi_widget.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Widget'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/imagen1.jpg',
                  fit: BoxFit.cover,
                  height: 300.0,
                  width: 300.0,
                ),
                Center(
                  child: ListTile(
                    title: Text('Sede Osorno'),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/imagen2.jpg',
                  fit: BoxFit.cover,
                  height: 300.0,
                  width: 300.0,
                ),
                Center(
                  child: ListTile(
                    title: Text('Sede Puerto Montt'),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/imagen3.jpg',
                  fit: BoxFit.cover,
                  height: 300.0,
                  width: 300.0,
                ),
                Center(
                  child: ListTile(
                    title: Text('Sede Chiloé'),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _launchUlagosURL();
            },
            child: Text('Ir a Ulagos'),
          ),
        ],
      ),
    );
  }

  _launchUlagosURL() async {
    const url = 'https://www.ulagos.cl/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL';
    }
  }
}
