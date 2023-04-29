import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String password = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Contraseñas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  '32 caracteres:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('$password'),
                    IconButton(
                        onPressed: () {
                          password = _generatePass(32);
                          setState((() {}));
                        },
                        icon: Icon(Icons.refresh)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.copy))
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                password = _generatePass(32);
                setState((() {}));
              },
              child: Text('Generar Contraseñas')),
          OutlinedButton(
              onPressed: () {
                password = ' ';
                setState((() {}));
              },
              child: Text('Borrar contraseña')),
        ],
      ),
    );
  }

  String _generatePass(int charNumber) {
    return String.fromCharCodes(
      List.generate(charNumber, (index) => Random().nextInt(48) + 60),
    );
  }
}
