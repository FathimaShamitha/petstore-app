import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/listtile.dart';

import 'adminpetdetailsview.dart';

class AdminDogsViewClass extends StatelessWidget {
  const AdminDogsViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Pets")
            .where("type", isEqualTo: "Dog")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            ));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error!!!!!!"),
            );
          }
          if (snapshot.hasData) {
            List dogList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: dogList.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPetDetailsViewClass(docId: snapshot.data!.docs[index].id,)));
                    },
                    child: MyListTileClass(
                        image: dogList[index]['imageurl'],
                        name: dogList[index]['breed'],
                        price: dogList[index]['price'],
                        qty: dogList[index]['age']),
                  );
                });
          } else {
            return Center(
              child: Text("Something Went WRong"),
            );
          }
        },
      ),
    );
  }
}
