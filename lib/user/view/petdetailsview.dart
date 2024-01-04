import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:petstore/Widgets/simpletext.dart';

class UserPetDetailsClass extends StatefulWidget {
  const UserPetDetailsClass({Key? key, required this.docId}) : super(key: key);
  final String docId;

  @override
  State<UserPetDetailsClass> createState() => _UserPetDetailsClassState();
}

class _UserPetDetailsClassState extends State<UserPetDetailsClass> {
  String uid = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUid();
  }

  void getUid() async {
    var ref = FirebaseAuth.instance;
    User user = ref.currentUser!;
    setState(() {
      uid = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Pets")
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
                    image: NetworkImage(snapshot.data['imageurl']),
                  ),
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextClass(
                        title: "Breed", content: "${snapshot.data['breed']}"),
                    Divider(),
                    MyTextClass(
                        title: "Fur Colour",
                        content: "${snapshot.data['fur']}"),
                    Divider(),
                    MyTextClass(
                        title: "Age", content: "${snapshot.data['age']}"),
                    Divider(),
                    MyTextClass(
                        title: "Gender", content: "${snapshot.data['gender']}"),
                    Divider(),
                    MyTextClass(
                        title: "Price",
                        content: "${snapshot.data['price']} INR"),
                    Divider(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.purple),
                  child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Pets')
                            .doc(widget.docId)
                            .update({'bookingStatus': 'yes'});
                        setState(() {});
                        Fluttertoast.showToast(msg: 'Booked');
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Bookings")
                            .add({
                          "uid": uid,
                          "breed": snapshot.data['breed'],
                          "fur": snapshot.data['fur'],
                          "age": snapshot.data['age'],
                          "gender": snapshot.data['gender'],
                          "price": snapshot.data['price'],
                          "imageurl": snapshot.data['imageurl'],
                          "status": "booked",
                        });
                      },
                      child: const Text(
                        "Book",
                      )),
                )
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
