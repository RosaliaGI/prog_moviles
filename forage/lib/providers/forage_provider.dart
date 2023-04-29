import 'package:flutter/material.dart';
import 'package:forage/models/forage/forage.dart';

class ForageProvider with ChangeNotifier {
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  bool? isSelected = false;
  var notesController = TextEditingController();
  List<Forage> forageList = [];

  void setIsSelected(bool? checkboxValue) {
    isSelected = checkboxValue;
    notifyListeners();
  }
}
