import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/user/view/petdetailsview.dart';

import '../../Widgets/customwidget1.dart';

class UserAllPetsClass extends StatelessWidget {
  const UserAllPetsClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Pets").snapshots(),
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
            return GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      snapshot.data.docs[index]['bookingStatus'] == "no"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPetDetailsClass(
                                        docId: snapshot.data.docs[index].id,
                                      )))
                          : Fluttertoast.showToast(msg: "Already Booked");
                    },
                    child: snapshot.data.docs[index]['bookingStatus'] == "no"
                        ? MyColumnClass(
                            imageUrl: snapshot.data.docs[index]['imageurl'],
                            name: snapshot.data.docs[index]['breed'],
                            price: snapshot.data.docs[index]['price'])
                        : Stack(
                            children: [
                              MyColumnClass(
                                  imageUrl: snapshot.data.docs[index]
                                      ['imageurl'],
                                  name: snapshot.data.docs[index]['breed'],
                                  price: snapshot.data.docs[index]['price']),
                              CircleAvatar(
                                radius: 20,
                                child: Icon(Icons.done_all_outlined),
                                backgroundColor: Colors.purple,
                              )
                            ],
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
