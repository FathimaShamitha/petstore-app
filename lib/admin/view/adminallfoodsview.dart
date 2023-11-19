import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/listtile.dart';

import '../../Widgets/alertdialogue.dart';
import 'adminfooddetailsview.dart';

class AdminAllFoodClass extends StatelessWidget {
  const AdminAllFoodClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Foods").snapshots(),
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
              child: Text("Error!!!!"),
            );
          }
          if (snapshot.hasData) {
            List foodList = snapshot.data.docs;
            return ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (_, index) {
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
                      image: foodList[index]['image'],
                      name: foodList[index]['name'],
                      price: foodList[index]['price'],
                      qty: foodList[index]['quantity'],
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
              child: Text("Something Went Wromg"),
            );
          }
        },
      ),
    );
  }
}
