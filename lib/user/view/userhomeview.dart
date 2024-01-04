import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/customtext.dart';
import 'package:petstore/Widgets/homeappbar.dart';
import 'package:petstore/user/view/userbookingsview.dart';
import 'package:petstore/user/view/userpetview.dart';

import '../../Widgets/homecarouselslider.dart';
import '../../Widgets/simplelisttile.dart';
import '../../home/login.dart';
import 'homepetstream.dart';

class UserHomeClass extends StatelessWidget {
  const UserHomeClass({Key? key}) : super(key: key);

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
        backgroundColor: Colors.purple[100],
        width: MediaQuery.of(context).size.width * 0.6,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHomeClass()));
                  },
                  child: const MySimpleListTileClass(
                      myicon: Icons.home, title: 'Home')),
              const MySimpleListTileClass(
                  myicon: Icons.account_circle, title: 'Profile'),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserBookingsViewClass()));
                },
                child: const MySimpleListTileClass(
                    myicon: Icons.bookmark_outline, title: 'My Bookings'),
              ),
              const MySimpleListTileClass(
                  myicon: Icons.settings, title: 'Settings'),
              const MySimpleListTileClass(
                  myicon: Icons.info_outline_rounded, title: 'About'),
              Divider()
            ],
          ),
        ),
      ),
      body: Container(
        height: ht,
        width: wth,
        child: ListView(
          children: [
            Card(
              color: Colors.purple[200],
              child: Container(
                height: ht * 0.3,
                width: wth,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/homeview.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                    Center(
                        child: Text(
                      "Find Your Best Companion With Us",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
            ),
            MyCustomTextClass(txt: "Popular Pets"),
            MyCarouselClass(),
            MyCustomTextClass(txt: "Store"),
            SizedBox(height: 200, child: const HomePetStreamClass()),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserPetsViewClass()));
                  },
                  child: const Text(
                    "View All->",
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            /*MyCustomTextClass(txt: "Pet Foods"),
            SizedBox(
              height: 200,
              child: HomeFoodStreamClass(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserFoodViewClass()));
                  },
                  child: const Text(
                    "View All->",
                    style: TextStyle(color: Colors.blue),
                  )),
            ),*/
          ],
        ),
      ),
    );
  }
}
