import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/alertdialogue.dart';
import 'package:petstore/Widgets/appbar.dart';

class AdminPetDetailsViewClass extends StatefulWidget {
  const AdminPetDetailsViewClass({Key? key, required this.docId})
      : super(key: key);
  final docId;

  @override
  State<AdminPetDetailsViewClass> createState() => _AdminPetDetailsViewState();
}

class _AdminPetDetailsViewState extends State<AdminPetDetailsViewClass> {
  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Pets")
            .doc(widget.docId)
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
            return Center(child: Text("Error!!!!"));
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  height: ht / 3,
                  width: wth,
                  child: Image(
                    image: NetworkImage(snapshot.data['imageurl']),
                  ),
                ),
                Divider(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Breed : ${snapshot.data['breed']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Divider(),
                        Text(
                          "Age : ${snapshot.data['age']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(),
                        Text(
                          "Fur : ${snapshot.data['fur']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(),
                        Text(
                          "Gender : ${snapshot.data['gender']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(),
                        Text(
                          "Price : ${snapshot.data['price']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.orange, fontSize: 18),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var alertDialog = MyAlertDialogueClass(
                              title: "Are you sure you want to Delete",
                              content:
                                  "This action will permanently delete this data",
                              yes: "Delete",
                              no: "Cancel",
                              onYesPressed: () {
                                /*await FirebaseFirestore.instance
                                    .collection("Pets")
                                    .doc(snapshot.data.docs[index].id)
                                    .delete();
                                Navigator.pop(context);*/
                                Fluttertoast.showToast(msg: "Deleted");
                                Navigator.pop(context);
                              },
                              onNoPressed: () {
                                Navigator.pop(context);
                              });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => alertDialog);
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.orange, fontSize: 18),
                        )),
                  ],
                )
              ],
            );
          } else {
            return Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
