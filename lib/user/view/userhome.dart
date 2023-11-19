import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/homeappbar.dart';
import 'package:petstore/Widgets/simplelisttile.dart';
import 'package:petstore/user/view/homefoodstream.dart';
import 'package:petstore/user/view/homepetstream.dart';
import 'package:petstore/user/view/userfoodview.dart';
import 'package:petstore/user/view/userpetview.dart';

import '../../Widgets/homecarouselslider.dart';
import '../../home/login.dart';

class UserHomeClass extends StatelessWidget {
  const UserHomeClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      MaterialPageRoute(builder: (context) => UserHomeClass()));
                },
                child:
                    MySimpleListTileClass(myicon: Icons.home, title: 'Home')),
            MySimpleListTileClass(
                myicon: Icons.account_circle, title: 'Profile'),
            MySimpleListTileClass(myicon: Icons.shopping_cart, title: 'Cart'),
            MySimpleListTileClass(
                myicon: Icons.shopping_bag, title: 'Purchases'),
            MySimpleListTileClass(myicon: Icons.settings, title: 'Settings'),
            MySimpleListTileClass(
                myicon: Icons.info_outline_rounded, title: 'About'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCarouselClass(),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Text(
                "Pets",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: HomePetStreamClass()),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserPetsViewClass()));
                  },
                  child: Text(
                    "View All->",
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Text(
                "Foods",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: HomeFoodStreamClass()),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserFoodViewClass()));
                  },
                  child: Text(
                    "View All->",
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
