import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

import '../../Widgets/customwidget1.dart';

class UserBookingsViewClass extends StatefulWidget {
  const UserBookingsViewClass({Key? key}) : super(key: key);

  @override
  State<UserBookingsViewClass> createState() => _UserBookingsViewClassState();
}

class _UserBookingsViewClassState extends State<UserBookingsViewClass> {
  String uid = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUid();
  }

  void getUid() async {
    var ref = FirebaseAuth.instance;
    User user = ref.currentUser!;
    setState(() {
      uid = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Bookings")
            .where("uid", isEqualTo: uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return MyColumnClass(
                      imageUrl: snapshot.data.docs[index]['imageurl'],
                      name: snapshot.data.docs[index]['breed'],
                      price: snapshot.data.docs[index]['price']);
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
