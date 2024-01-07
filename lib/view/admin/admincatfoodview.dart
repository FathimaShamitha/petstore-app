/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/alertdialogue.dart';
import 'package:petstore/controller/admincontroller.dart';
import 'package:provider/provider.dart';

import '../../Widgets/listtile.dart';
import 'adminfooddetailsview.dart';

class AdminCatFoodViewClass extends StatelessWidget {
  const AdminCatFoodViewClass({Key? key}) : super(key: key);

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
                            onYesPressed: ()  {
                              Provider.of<AdminController>(context, listen: false)
                                  .deleteFoodDetails(snapshot.data.docs[index].id);
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
            return const Center(
              child: Text("Something Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
*/
