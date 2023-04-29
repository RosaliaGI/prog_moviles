import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class Notas extends StatelessWidget {
  const Notas({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
        query: FirebaseFirestore.instance.collection("biblio-books"),
        itemBuilder: (context, snapshot) {
          return Text('${snapshot["titulo"]}');
        });
  }
}
