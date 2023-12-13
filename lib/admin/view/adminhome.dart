import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/homeappbar.dart';
import 'package:petstore/admin/view/addpet.dart';
import 'package:petstore/admin/view/petsview.dart';
import 'package:petstore/admin/view/usersview.dart';
import '../../Widgets/card.dart';
import '../../Widgets/simplelisttile.dart';
import '../../home/login.dart';
import 'addfood.dart';
import 'foodview.dart';

class AdminHomeClass extends StatelessWidget {
  const AdminHomeClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: HomeAppBarClass(
        func: () async {
          await FirebaseAuth.instance.signOut();
          Fluttertoast.showToast(msg: "Logged Out");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginClass()));
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
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
                          builder: (context) => const AdminHomeClass()));
                },
                child: const MySimpleListTileClass(
                  myicon: Icons.home,
                  title: 'Home',
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PetsViewClass()));
                },
                child: const MySimpleListTileClass(
                  myicon: Icons.pets,
                  title: 'Pets',
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FoodViewClass()));
                },
                child: const MySimpleListTileClass(
                    myicon: Icons.food_bank_sharp, title: 'Foods')),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const UserViewClass()));
                },
                child: const MySimpleListTileClass(
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
                      MaterialPageRoute(builder: (context) => const AddPetsClass()));
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
                      MaterialPageRoute(builder: (context) => const AddFoodClass()));
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
