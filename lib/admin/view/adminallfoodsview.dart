import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/listtile.dart';

class AdminAllFoodClass extends StatelessWidget {
  const AdminAllFoodClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Foods").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error!!!!"),
            );
          }
          if (snapshot.hasData) {
            List foodList = snapshot.data.docs;
            return ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (_, index) {
                  return MyListTileClass(
                      image: foodList[index]['image'],
                      name: foodList[index]['name'],
                      price: foodList[index]['price'],
                      qty: foodList[index]['quantity']);
                });
          } else {
            return Center(
              child: Text("Something Went Wromg"),
            );
          }
        },
      ),
    );
  }
}
