import 'package:flutter/material.dart';
import 'package:forage/form_forage.dart';
import 'package:provider/provider.dart';
import 'package:forage/providers/forage_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ForageProvider>().forageList.length,
        itemBuilder: (BuildContext context, int index) {
          var forag = context.watch<ForageProvider>().forageList[index];
          return ListTile(
            title: Text('${forag.name}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => FormForage(),
            ),
          )
              .then((value) {
            print(value);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
