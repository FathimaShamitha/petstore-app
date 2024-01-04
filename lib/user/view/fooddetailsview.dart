import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/utilities/colors.dart';
import 'package:petstore/utilities/textstyles.dart';

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
                color: Colors.purple,
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
                        Text(" ${snapshot.data['name']}",
                            style: MyTextStyle.bigText),
                        Text("${snapshot.data['category']}",
                            style: MyTextStyle.smallText),
                        Text("${snapshot.data['quantity']}",
                            style: MyTextStyle.smallText),
                        Text(" ${snapshot.data['price']}",
                            style: MyTextStyle.smallText),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Add To Cart",
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
