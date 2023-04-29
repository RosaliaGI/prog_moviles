import 'dart:convert';
import 'package:flutter/material.dart';
import 'data/constants.dart';

class HomePage extends StatelessWidget {
  var exchanges = jsonDecode(CRYPTO_EXCHANGES) as List;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto APP"),
      ),
      body: ListView.separated(
        itemCount: exchanges.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network('${exchanges[index]['image']}'),
            title: Text('${exchanges[index]['name']}'),
            subtitle: Text(
                '${exchanges[index]['country']}\n${exchanges[index]['year_established']}'),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text('${exchanges[index]['trust_score']}'),
            ),
          );
        },
      ),
    );
  }
}
