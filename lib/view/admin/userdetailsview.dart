import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:petstore/Widgets/listtile.dart';
import 'package:provider/provider.dart';

import '../../Widgets/alertdialogue.dart';
import '../../controller/admincontroller.dart';

class AdminUserDetailsViewClass extends StatelessWidget {
  const AdminUserDetailsViewClass({Key? key, required this.uId})
      : super(key: key);
  final String uId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Bookings")
            .where('uid', isEqualTo: uId)
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
            List BookingList = snapshot.data.docs;
            return ListView.builder(
                itemCount: BookingList.length,
                itemBuilder: (context, index) {
                  return MyListTileClass(
                    image: BookingList[index]['imageurl'],
                    name: BookingList[index]['breed'],
                    price: BookingList[index]['price'],
                    func: () {
                      var alertDialog = MyAlertDialogueClass(
                          title: "Are you sure you want to Delete",
                          content: "This action will permanently delete data",
                          yes: "Delete",
                          no: "Cancel",
                          onYesPressed: () {
                            Provider.of<AdminController>(context, listen: false)
                                .deleteBookings(snapshot.data.docs[index].id);
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
                  );
                });
          } else {
            return Center(
              child: Text('Something Went Wrong'),
            );
          }
        },
      ),
    );
  }
}
