import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends ChangeNotifier {
  List<File> image = [];
  List imageUrl = [];

  Future<void> getImage() async {
    final List<XFile>? selectedImages =
        await ImagePicker().pickMultiImage(imageQuality: 50);
    if (selectedImages!.isNotEmpty) {
      image = selectedImages.map((img) => File(img.path)).toList();
    }
    notifyListeners();
  }

  /*Future<void> uploadImage() async {
    for (var img in image) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference imgRef =
          FirebaseStorage.instance.ref().child('images/$fileName.jpg');
      UploadTask task = imgRef.putFile(img);
      await task.whenComplete(() async {
        String url = await imgRef.getDownloadURL();
        imageUrl.add(url);
      });
    }
  }*/

  Future<void> uploadImage() async {
    image.forEach((element) async {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final imgRef = FirebaseStorage.instance.ref().child("PET_IMAGES/$fileName");
      UploadTask task = imgRef.putFile(element);
      final snap = await task!.whenComplete(() {});
      var imgLink = await snap.ref.getDownloadURL();
      imageUrl.add(imgLink);
    });
  }
}
