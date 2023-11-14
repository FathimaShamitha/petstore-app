import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends ChangeNotifier {
  File? image;

  uploadImage() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(img!.path);
    notifyListeners();
  }
}
