import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

import '../Widgets/card.dart';

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
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(
                Icons.pets,
                color: Colors.orange,
              ),
              title: Text("View Pets"),
            ),
            ListTile(
              leading: Icon(
                Icons.food_bank,
                color: Colors.orange,
              ),
              title: Text("View Foods"),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.orange,
              ),
              title: Text("View Accessories"),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.orange,
              ),
              title: Text("View Users"),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ),
              title: Text("View Purchases"),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            child: MyCardClass(
              height: ht / 4,
              width: wth / 2,
              txt: 'Add Pets',
            ),
          ),
          MyCardClass(
            height: ht / 4,
            width: wth / 2,
            txt: 'Add Foods',
          ),
          MyCardClass(
            height: ht / 4,
            width: wth / 2,
            txt: 'Add Accessories',
          ),
        ],
      ),
    );
  }
}
