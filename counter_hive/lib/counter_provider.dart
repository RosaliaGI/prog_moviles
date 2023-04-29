import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  int get getCounter => _counter;
  bool _switched = false;
  bool get getSwitched => _switched;

  incrementCounter() {
    _counter++;
    notifyListeners();
  }

  saveCounter() async {
    // abrir la box
    var box = await Hive.openBox<int>('contadores');
    var box2 = await Hive.openBox<bool>('switches');
    // guardar _counter en la celda
    await box.put('countTillNow', _counter);
    await box2.put('switch', _switched);
  }

  loadCounter() async {
    // abrir la box
    var box = await Hive.openBox<int>('contadores');
    var box2 = await Hive.openBox<bool>('switches');
    // extraer contenido de la box
    _counter = box.get('countTillNow') ?? 0;
    _switched = box2.get('switch') ?? false;
    // acutalizar counter & notify listeners
    notifyListeners();
  }

  setSwitch(bool enable) {
    _switched = enable;
    notifyListeners();
  }
}
