import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class UserViewClass extends StatelessWidget {
  const UserViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
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
            List userList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: Text(userList[index]['username']),
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
