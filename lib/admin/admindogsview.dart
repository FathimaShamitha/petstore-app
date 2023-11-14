import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDogsViewClass extends StatefulWidget {
  const AdminDogsViewClass({Key? key}) : super(key: key);

  @override
  State<AdminDogsViewClass> createState() => _AdminDogsViewClassState();
}

class _AdminDogsViewClassState extends State<AdminDogsViewClass> {
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
                  return ListTile(
                    leading: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image(
                          image: NetworkImage(dogList[index]['imageurl']),
                          fit: BoxFit.cover,
                        )),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dogList[index]['breed'],style: TextStyle(fontSize: 20),),
                        Text("${dogList[index]['price']}",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text("${dogList[index]['age']},"),
                        SizedBox(width: 5,),
                        Text("${dogList[index]['gender']}"),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.orange,
                          size: 20,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ],
                    ),
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
