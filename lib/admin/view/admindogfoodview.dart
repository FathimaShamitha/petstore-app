import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Widgets/alertdialogue.dart';
import '../../Widgets/listtile.dart';
import 'adminfooddetailsview.dart';

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
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminFoodDetailsViewClass(
                                    docId: snapshot.data!.docs[index].id,
                                  )));
                    },
                    child: MyListTileClass(
                      image: catList[index]['image'],
                      name: catList[index]['name'],
                      price: catList[index]['price'],
                      qty: catList[index]['quantity'],
                      func: () {
                        var alertDialog = MyAlertDialogueClass(
                            title: "Are you sure you want to Delete",
                            content: "This action will permanently delete data",
                            yes: "Delete",
                            no: "Cancel",
                            onYesPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("Foods")
                                  .doc(snapshot.data.docs[index].id)
                                  .delete();
                              Navigator.pop(context);
                              Fluttertoast.showToast(msg: "Deleted");
                            },
                            onNoPressed: () {
                              Navigator.pop(context);
                              return;
                            });
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => alertDialog);
                      },
                    ),
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
