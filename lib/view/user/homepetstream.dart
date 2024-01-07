import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/customwidget1.dart';
import 'package:petstore/utilities/colors.dart';
import 'package:petstore/view/user/userpetview.dart';

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
              color: MyAppColor.primaryColor,
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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPetsViewClass()));
                      },
                      child: MyColumnClass(
                          imageUrl: snapshot.data.docs[index]['imageurl'],
                          name: snapshot.data.docs[index]['breed'],
                          price: snapshot.data.docs[index]['price']),
                    )
                  ],
                );
              });
        } else {
          return const Center(
            child: Text("Something Went Wrong"),
          );
        }
      },
    ));
  }
}
