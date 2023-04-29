//import 'package:amphibians/home_page.dart';
import 'package:amphibians/home_page2.dart';
import 'package:amphibians/providers/amphibians_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => AmphibiansProvider()..getAmphibians(),
        child: HomePage2(),
      ),
    );
  }
}
