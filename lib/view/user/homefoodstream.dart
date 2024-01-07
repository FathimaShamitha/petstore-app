import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Widgets/customwidget1.dart';

class HomeFoodStreamClass extends StatelessWidget {
  const HomeFoodStreamClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Foods").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
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
                          imageUrl: snapshot.data.docs[index]['image'],
                          name: snapshot.data.docs[index]['name'],
                          price: snapshot.data.docs[index]['price']),
                    ],
                  );
                });
          } else {
            return const Center(
              child: Text("Something Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
