import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petstore/Widgets/listtile.dart';

import 'adminpetdetailsview.dart';

class AdminAllPetsClass extends StatelessWidget {
  const AdminAllPetsClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Pets").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error!!!!"),
          );
        }
        if (snapshot.hasData) {
          List petList = snapshot.data!.docs;
          return ListView.builder(
              itemCount: petList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPetDetailsViewClass(docId: snapshot.data!.docs[index].id,)));
                  },
                  child: MyListTileClass(
                    image: petList[index]['imageurl'],
                    name: petList[index]['breed'],
                    price: petList[index]['price'],
                    qty: petList[index]['age'],
                  ),
                );
              });
        } else {
          return Center(
            child: Text("Something Went Wrong"),
          );
        }
      },
    ));
  }
}
