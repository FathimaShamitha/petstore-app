import 'package:flutter/material.dart';
import 'package:petstore/admin/view/addpet.dart';
import 'package:petstore/admin/view/petsview.dart';
import 'package:petstore/admin/view/usersview.dart';
import '../../Widgets/card.dart';
import '../../Widgets/simplelisttile.dart';
import '../../utilities/constants.dart';
import 'addfood.dart';

class AdminHomeClass extends StatelessWidget {
  const AdminHomeClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          MyConstants().appTitle,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.logout,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminHomeClass()));
                },
                child: MyListTileClass(
                  myicon: Icons.home,
                  title: 'Home',
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PetsViewClass()));
                },
                child: MyListTileClass(
                  myicon: Icons.pets,
                  title: 'Pets',
                )),
            MyListTileClass(myicon: Icons.food_bank_sharp, title: 'Foods'),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserViewClass()));
                },
                child: MyListTileClass(
                  myicon: Icons.account_circle,
                  title: 'Users',
                )),
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
                      MaterialPageRoute(builder: (context) => AddFoodClass()));
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
