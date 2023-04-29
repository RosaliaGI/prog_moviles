import 'package:flutter/material.dart';
import 'package:forage/models/forage.dart';

class ForageProvider with ChangeNotifier {
  // Text controllers
  var nameCont = TextEditingController();
  var locationCont = TextEditingController();
  var notesCont = TextEditingController();
  // variables
  List<Forage?> _forageList = [];
  bool _isInSeason = false;
  // getters
  List<Forage?> get getForageList => _forageList;
  bool get getIsInSeason => _isInSeason;

  void saveNewForage() {
    // TODO: guardar los datos de un Forage y agregarlo a la lista
  }
  void clearNewForage() {
    // TODO: limpiar las selecciones y textos actuales
  }
  void deleteExistingForage(int index) {
    // TODO: Borrar un forage de la lista
  }
  void setCurrentlyInSeason(bool newValue) {
    // TODO: indicar el valor que debe desplegar el checkbox
  }
}
