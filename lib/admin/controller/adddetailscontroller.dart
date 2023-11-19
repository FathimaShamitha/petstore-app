import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddDetails extends ChangeNotifier {
  var db_ref;

  addPetDetails(type, breed, color, age, gender, price, image) async {
    db_ref = await FirebaseFirestore.instance.collection("Pets").add({
      "type": type,
      "breed": breed,
      "fur": color,
      "age": age,
      "gender": gender,
      "price": price,
      "imageurl": image
    });
    notifyListeners();
  }

  addFoodDetails(name, type, category, price, quantity, image) async {
    db_ref = await FirebaseFirestore.instance.collection("Foods").add({
      "name": name,
      "type": type,
      "category": category,
      "price": price,
      "quantity": quantity,
      "image": image
    });
    notifyListeners();
  }
}
