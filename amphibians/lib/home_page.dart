import 'dart:convert';

import 'package:amphibians/models/amphibian/amphibian.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amphibians'),
      ),
      body: FutureBuilder(
        future: _getAmphibians(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Ha ocurrido un error'),
            );
          } else if (snapshot.hasData) {
            var amphibians = snapshot.data ?? [];
            return ListView.builder(
              itemCount: amphibians.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${amphibians[index].name}'),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Amphibian>?> _getAmphibians() async {
    try {
      var response = await get(Uri.parse("https://bit.ly/3XPPD2C"));
      if (response.statusCode == 200) {
        List<Amphibian> amphibians;
        amphibians = (jsonDecode(response.body) as List)
            .map((e) => Amphibian.fromMap(e))
            .toList();
        return amphibians;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

// https://bit.ly/3XPPD2C