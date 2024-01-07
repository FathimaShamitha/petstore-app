import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:petstore/view/admin/userdetailsview.dart';

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
                color: Colors.purple,
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
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                      title: Text(
                        userList[index]['username'],
                      ),
                      subtitle: Text(userList[index]['email']),
                      trailing: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AdminUserDetailsViewClass(
                                          uId: userList[index]['uid'],
                                        )));
                          },
                          child: Text(
                            'View Bookings',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
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
