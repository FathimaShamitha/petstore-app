import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                return ListTile(
                  leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: NetworkImage(petList[index]['imageurl']),
                        fit: BoxFit.cover,
                      )),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petList[index]['breed'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        petList[index]['price'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text("${petList[index]['age']},"),
                      Text(petList[index]['gender']),
                    ],
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.orange,
                    size: 20,
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
