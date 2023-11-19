import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Widgets/customWidget1.dart';
import 'fooddetailsview.dart';

class UserCatFoodView extends StatelessWidget {
  const UserCatFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Foods")
            .where('type', isEqualTo: 'Cat Food')
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
            return GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserFoodDetailsClass(
                                    docId: snapshot.data.docs[index].id,
                                  )));
                    },
                    child: MyColumnClass(
                        imageUrl: snapshot.data.docs[index]['image'],
                        name: snapshot.data.docs[index]['name'],
                        price: snapshot.data.docs[index]['price']),
                  );
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
