import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class UserBookingsViewClass extends StatefulWidget {
  const UserBookingsViewClass({Key? key}) : super(key: key);

  @override
  State<UserBookingsViewClass> createState() => _UserBookingsViewClassState();
}

class _UserBookingsViewClassState extends State<UserBookingsViewClass> {
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
    return Scaffold(
      appBar: MyAppBarClass(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Bookings")
            .where("uid", isEqualTo: uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Bookings Yet"),
            );
          }
          if (snapshot.hasData) {
            List BookingsList = snapshot.data.docs;
            return ListView.builder(
                itemCount: BookingsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 10, left: 10),
                              child: Image(
                                image: NetworkImage(
                                    BookingsList[index]['imageurl']),
                              ),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              BookingsList[index]['breed'],
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(BookingsList[index]['fur'],
                                style: TextStyle(fontSize: 18)),
                            Text(BookingsList[index]['age'],
                                style: TextStyle(fontSize: 18)),
                            Text("${BookingsList[index]['price']} INR",
                                style: TextStyle(fontSize: 18)),
                          ],
                        )
                      ],
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
