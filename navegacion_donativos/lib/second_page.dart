import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  //final String texto;

  SecondPage({
    super.key,
    //required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page:'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop('Hola mundo');
          },
          child: Text('Regresar un dato'),
        ),
      ),
    );
  }
}
