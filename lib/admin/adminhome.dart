import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:petstore/admin/petsview.dart';
import 'package:petstore/admin/usersview.dart';

import '../Widgets/card.dart';
import 'addfood.dart';
import 'addpet.dart';

class AdminHomeClass extends StatefulWidget {
  const AdminHomeClass({Key? key}) : super(key: key);

  @override
  State<AdminHomeClass> createState() => _AdminHomeClassState();
}

class _AdminHomeClassState extends State<AdminHomeClass> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBarClass(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.orange,
              child: Text(
                "A",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AdminHomeClass()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.orange,
                ),
                title: Text("Home"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PetsViewClass()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.pets,
                  color: Colors.orange,
                ),
                title: Text("Pets"),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.food_bank,
                color: Colors.orange,
              ),
              title: Text("Foods"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserViewClass()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.orange,
                ),
                title: Text("Users"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPetsClass()));
                },
                child: MyCardClass(
                  height: ht / 4,
                  width: wth / 2,
                  txt: 'Add Pets',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddFoodsClass()));
                },
                child: MyCardClass(
                  height: ht / 4,
                  width: wth / 2,
                  txt: 'Add Foods',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
