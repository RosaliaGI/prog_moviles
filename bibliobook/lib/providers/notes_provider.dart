import 'package:bibliobook/providers/choose_picture_provider.dart';
import 'package:bibliobook/providers/record_audio_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier {
  // singleton
  static final NotesProvider _singleton = NotesProvider._internal();
  factory NotesProvider() {
    return _singleton;
  }
  NotesProvider._internal();

  final pictProvider = ChoosePictureProvider();
  final audioProvider = RecordAudioProvider();
  var urlCtrl = TextEditingController();
  var titleCtrl = TextEditingController();
  var descCtrl = TextEditingController();

  void borrar() async {
    // borrar formulario
    pictProvider.borrarImagen();
    // borrar archivo de audio
    audioProvider.audioFile = null;
    urlCtrl.clear();
    titleCtrl.clear();
    descCtrl.clear();
    notifyListeners();
  }

  Future guardarNotaDeLibro() async {
    // crear el objeto mapa con los datos del libro
    String imgUrl =
        await _uploadFileToStorage(); // subir la imagen al bucket de Cloud Storage
    if (imgUrl == "") return;
    try { 
      Map<String, dynamic> dataToSave = {
        // crear el objeto a guardar
        "titulo": titleCtrl.text,
        "descripcion": descCtrl.text,
        "url": urlCtrl.text,
        "img": imgUrl,
        "savedTime": Timestamp.fromDate(DateTime.now()),
        "audio": audioProvider.file64,
      };
      // guardar en firestore
      await FirebaseFirestore.instance
          .collection("biblio-books")
          .add(dataToSave);
      notifyListeners();
    } catch (e) {
      print('Error al guardar los datos en Cloud Firestore: ${e.toString()}');
    }
  }

  Future<String> _uploadFileToStorage() async {
    try {
      if (pictProvider.getPicture == null) return "";
      var _stamp = DateTime.now();
      // definir la upload task
      UploadTask _task = FirebaseStorage.instance
          .ref("libros/imagen_${_stamp}.png")
          .putFile(pictProvider.getPicture!);
      // ejecutar la task
      await _task;
      // recuperar la url del archivo
      return await _task.storage
          .ref("libros/imagen_${_stamp}.png")
          .getDownloadURL();
    } catch (e) {
      print('Error al subir el archivo a Cloud Storage: ${e.toString()}');
      return "";
    }
  }
}

// TODO: implementar el guardado de datos en Cloud Firestore
// TODO: implementar guardado de imagenes/audios en Cloud Storage
// TODO: cambie el app icon a un icono mas bonito
// TODO: renombre la app