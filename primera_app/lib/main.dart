import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Birthday Card'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Happy Birthday Frank",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    "https://static.vecteezy.com/system/resources/previews/002/476/508/original/color-glossy-happy-birthday-balloons-banner-background-illustration-free-vector.jpg",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            print("Hola");
                          },
                          icon: Icon(Icons.air)),
                      Text("From Mike"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
