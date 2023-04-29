import 'package:flutter/material.dart';
import 'package:navegacion_donativos/second_page.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      // initialRoute: '/home',
      // routes: {
      //   '/home': (context) => HomePage(),
      //   '/second': (context) => SecondPage()
      // },
    );
  }
}
