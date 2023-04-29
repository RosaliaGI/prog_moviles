import 'package:flutter/material.dart';
import 'package:navegacion_donativos/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Ir a Page 2'),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            )
                .then((value) {
              print(value);
            });
            // Navigator.of(context).pushNamed('/second');
          },
        ),
      ),
    );
  }
}
