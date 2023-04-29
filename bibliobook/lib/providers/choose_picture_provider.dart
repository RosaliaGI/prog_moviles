import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChoosePictureProvider with ChangeNotifier {
  static final ChoosePictureProvider _singleton =
      ChoosePictureProvider._internal();
  factory ChoosePictureProvider() {
    return _singleton;
  }
  ChoosePictureProvider._internal();

  File? _selectedPicture;
  File? get getPicture => _selectedPicture;

  void choosePictureFromCamera() async {
    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (_pickedFile != null) {
      _selectedPicture = File(_pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
      return;
    }
  }

  void borrarImagen() {
    _selectedPicture = null;
    notifyListeners();
  }
}
