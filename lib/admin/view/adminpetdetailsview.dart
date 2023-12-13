import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class AdminPetDetailsViewClass extends StatefulWidget {
  const AdminPetDetailsViewClass({Key? key, required this.docId})
      : super(key: key);
  final docId;

  @override
  State<AdminPetDetailsViewClass> createState() => _AdminPetDetailsViewState();
}

class _AdminPetDetailsViewState extends State<AdminPetDetailsViewClass> {
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
                color: Colors.orange,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(child:  Text("Error!!!!"));
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, bottom: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Breed : ${snapshot.data['breed']}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Divider(),
                        Text(
                          "Age : ${snapshot.data['age']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(),
                        Text(
                          "Fur : ${snapshot.data['fur']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(),
                        Text(
                          "Gender : ${snapshot.data['gender']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(),
                        Text(
                          "Price : ${snapshot.data['price']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
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
