import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class UserViewClass extends StatefulWidget {
  const UserViewClass({Key? key}) : super(key: key);

  @override
  State<UserViewClass> createState() => _UserViewClassState();
}

class _UserViewClassState extends State<UserViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
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
            List userList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(userList[index]['username']),
                  );
                });
          } else {
            return Center(
              child: Text("Somrthing Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
