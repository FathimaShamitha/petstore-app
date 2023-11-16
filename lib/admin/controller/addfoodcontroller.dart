import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddFoodDetailsClass extends ChangeNotifier{
  var db_ref;

  addFoodDetails(name,type,category,price,quantity,image)async{
    db_ref = await FirebaseFirestore.instance.collection("Foods").add({
     "name":name,"type":type,"category":category,"price":price,"quantity" :quantity,"image":image
    });
    notifyListeners();
  }
}
