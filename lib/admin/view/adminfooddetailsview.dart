import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class AdminFoodDetailsViewClass extends StatefulWidget {
  const AdminFoodDetailsViewClass({Key? key, required this.docId}) : super(key: key);
  final docId;

  @override
  State<AdminFoodDetailsViewClass> createState() =>
      _AdminFoodDetailsViewClassState();
}

class _AdminFoodDetailsViewClassState extends State<AdminFoodDetailsViewClass> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Foods")
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
                    image: NetworkImage(snapshot.data['image']),
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
                          "Brand : ${snapshot.data['name']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Divider(),
                        Text(
                          "Category : ${snapshot.data['category']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(),
                        Text(
                          "Quantity : ${snapshot.data['quantity']}",
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
                ElevatedButton(onPressed: () {}, child: Text("Edit"))
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
