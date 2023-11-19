import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class UserPetDetailsClass extends StatefulWidget {
  const UserPetDetailsClass({Key? key, required this.docId}) : super(key: key);
  final docId;

  @override
  State<UserPetDetailsClass> createState() => _UserPetDetailsClassState();
}

class _UserPetDetailsClassState extends State<UserPetDetailsClass> {
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
                      children: [
                        Text(
                          " ${snapshot.data['breed']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "${snapshot.data['fur']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "${snapshot.data['age']}, ${snapshot.data['gender']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          " ${snapshot.data['price']}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: () {}, child: Text("Add To Cart",style: TextStyle(color: Colors.white,fontSize: 18),))
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
