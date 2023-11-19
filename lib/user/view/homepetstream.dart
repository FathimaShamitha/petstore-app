import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/customWidget1.dart';

class HomePetStreamClass extends StatelessWidget {
  const HomePetStreamClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Pets").snapshots(),
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
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyColumnClass(
                        imageUrl: snapshot.data.docs[index]['imageurl'],
                        name: snapshot.data.docs[index]['breed'],
                        price: snapshot.data.docs[index]['price']),
                  ],
                );
              });
        } else {
          return Center(
            child: Text("Something Went Wrong"),
          );
        }
      },
    ));
  }
}
