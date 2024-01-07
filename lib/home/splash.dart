import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petstore/utilities/colors.dart';
import 'package:petstore/utilities/textstyles.dart';
import '../Widgets/headWidget.dart';
import '../utilities/constants.dart';
import '../view/admin/adminhome.dart';
import '../view/user/userhomeview.dart';
import 'login.dart';

class SplashScreenClass extends StatefulWidget {
  const SplashScreenClass({Key? key}) : super(key: key);

  @override
  State<SplashScreenClass> createState() => _SplashScreenClassState();
}

class _SplashScreenClassState extends State<SplashScreenClass> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      var ref = FirebaseAuth.instance;
      User? user = ref.currentUser;
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginClass()));
      } else {
        if (user!.uid == MyConstants().adminID) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AdminHomeClass()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => UserHomeClass()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: MyHeadingClass(txt: 'PetStore',)
        ),
      ),
    );
  }
}
