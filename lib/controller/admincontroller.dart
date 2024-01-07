import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AdminController extends ChangeNotifier {
  addPetDetails(type, breed, color, age, gender, price, image) async {
    var dbRef = await FirebaseFirestore.instance.collection("Pets").add({
      "type": type,
      "breed": breed,
      "fur": color,
      "age": age,
      "gender": gender,
      "price": price,
      "imageurl": image,
      "bookingStatus": 'no'
    });
    notifyListeners();
  }

  addFoodDetails(name, type, category, price, quantity, List image) async {
    var dbRef = await FirebaseFirestore.instance.collection("Foods").add({
      "name": name,
      "type": type,
      "category": category,
      "price": price,
      "quantity": quantity,
      "image": image
    });
    notifyListeners();
  }

  deletePetDetails(String id) async {
    await FirebaseFirestore.instance.collection("Pets").doc(id).delete();
    notifyListeners();
  }

  deleteFoodDetails(String id) async {
    await FirebaseFirestore.instance.collection("Foods").doc(id).delete();
    notifyListeners();
  }

  deleteBookings(String id) async{
    await FirebaseFirestore.instance.collection("Bookings").doc(id).delete();
    notifyListeners();
  }
}
