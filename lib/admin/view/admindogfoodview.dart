import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Widgets/listtile.dart';

class AdminDogFoodViewClass extends StatelessWidget {
  const AdminDogFoodViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Foods")
            .where('type', isEqualTo: 'Dog Food')
            .snapshots(),
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
              child: Text("Error"),
            );
          }
          if (snapshot.hasData) {
            List catList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: catList.length,
                itemBuilder: (context, index) {
                  return MyListTileClass(
                      image: catList[index]['image'],
                      name: catList[index]['name'],
                      price: catList[index]['price'],
                      qty: catList[index]['quantity']);
                });
          } else {
            return Center(
              child: Text("Something Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
