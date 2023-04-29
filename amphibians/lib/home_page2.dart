import 'package:amphibians/providers/amphibians_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({
    super.key,
  });

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amphibians'),
      ),
      body: ListView.builder(
        itemCount:
            context.watch<AmphibiansProvider>().getAamphibiansList.length,
        itemBuilder: (BuildContext context, int index) {
          var amph =
              context.watch<AmphibiansProvider>().getAamphibiansList[index];
          return ListTile(
            title: Text('${amph.name}'),
          );
        },
      ),
    );
  }
}

// https://bit.ly/3XPPD2C