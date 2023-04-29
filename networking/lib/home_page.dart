import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Text('Leer Posts'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                )),
            SizedBox.fromSize(size: Size(0, 20)),
            ElevatedButton(
                onPressed: () {},
                child: Text('Crear nuevo post'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                )),
          ],
        ),
      ),
    );
  }
}
