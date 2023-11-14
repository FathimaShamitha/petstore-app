import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminCatsViewClass extends StatelessWidget {
  const AdminCatsViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Pets")
            .where('type', isEqualTo: 'Cat')
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
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.hasData) {
            List catList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: catList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image(
                          image: NetworkImage(catList[index]['imageurl']),
                          fit: BoxFit.cover,
                        )),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${catList[index]['breed']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "${catList[index]['price']}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text("${catList[index]['age']},"),
                        Text(catList[index]['gender']),
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
              child: Text("Something Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
