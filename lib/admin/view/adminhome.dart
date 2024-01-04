import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/homeappbar.dart';
import 'package:petstore/admin/view/addpet.dart';
import 'package:petstore/admin/view/petsview.dart';
import 'package:petstore/admin/view/usersview.dart';
import '../../Widgets/card.dart';
import '../../home/login.dart';

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  'Add Details ',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPetsClass()));
                  },
                  child: MyCardClass(
                    height: ht / 5,
                    width: wth,
                    txt: 'Add Pets',
                    myIcon: Icons.add,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  'View Details ',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PetsViewClass()));
                  },
                  child: MyCardClass(
                    height: ht / 5,
                    width: wth,
                    txt: 'View Pets',
                    myIcon: Icons.arrow_forward_outlined,
                  )),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserViewClass()));
                },
                child: MyCardClass(
                    height: ht / 5,
                    width: wth,
                    txt: 'View Users',
                    myIcon: Icons.arrow_forward_outlined),
              )
            ],
          ),
        ));
  }
}
