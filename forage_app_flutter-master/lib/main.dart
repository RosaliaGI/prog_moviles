import 'package:flutter/material.dart';
import 'package:forage/forage_p/home_page_p.dart';
import 'package:provider/provider.dart';
import 'forage_p/providers/forage_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forage App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => ForageProvider(),
        child: HomePageP(),
      ),
    );
  }
}
