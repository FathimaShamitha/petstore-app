import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Widgets/appbar.dart';

class UserFoodDetailsClass extends StatefulWidget {
  const UserFoodDetailsClass({Key? key, required this.docId}) : super(key: key);
  final String docId;

  @override
  State<UserFoodDetailsClass> createState() => _UserFoodDetailsClassState();
}

class _UserFoodDetailsClassState extends State<UserFoodDetailsClass> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Foods")
            .doc(widget.docId)
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
            return const Center(child: Text("Error!!!!"));
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
                const Divider(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 10),
                    child: Column(
                      children: [
                        Text(
                          " ${snapshot.data['name']}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "${snapshot.data['category']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "${snapshot.data['quantity']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          " ${snapshot.data['price']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))
              ],
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
