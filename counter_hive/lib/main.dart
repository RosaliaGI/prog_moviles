import 'package:counter_hive/counter_provider.dart';
import 'package:flutter/material.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider()..loadCounter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
