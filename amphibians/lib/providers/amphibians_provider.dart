import 'dart:convert';

import '../models/amphibian/amphibian.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AmphibiansProvider with ChangeNotifier {
  String _amphEndpoint = "https://bit.ly/3XPPD2C";
  List<Amphibian> _amphibians = [];
  List<Amphibian> get getAamphibiansList => _amphibians;

  Future<void> getAmphibians() async {
    try {
      var response = await get(Uri.parse(_amphEndpoint));
      if (response.statusCode == 200) {
        _amphibians = (jsonDecode(response.body) as List)
            .map((e) => Amphibian.fromMap(e))
            .toList();
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
      _amphibians = [];
      notifyListeners();
    }
  }
}
