import 'package:flutter/material.dart';
import 'package:forage/forage_p/add_forage.dart';

class HomePageP extends StatelessWidget {
  HomePageP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage P'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Text("");
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navegar a pag AddForage
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddForage()),
          );
        },
      ),
    );
  }
}
