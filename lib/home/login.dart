import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/utilities/constants.dart';
import 'package:petstore/utilities/textstyles.dart';

import '../Widgets/headWidget.dart';
import '../view/admin/adminhome.dart';
import '../view/user/register.dart';
import '../view/user/userhomeview.dart';
import '../utilities/colors.dart';

class LoginClass extends StatefulWidget {
  @override
  State<LoginClass> createState() => LoginClassState();
}

class LoginClassState extends State<LoginClass> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                MyHeadingClass(
                  txt: 'Login',
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email field cannot be empty!!!!";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field cannot be empty";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          var auth_ref = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          User? user = auth_ref.user;
                          if (user!.uid == MyConstants().adminID) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminHomeClass()));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserHomeClass()));
                          }
                          Fluttertoast.showToast(msg: "Logged In");
                        } on FirebaseAuthException catch (e) {
                          Fluttertoast.showToast(
                              msg: "Enter valid Email and Password");
                        }
                      }
                    },
                    child: Text(
                      "Login",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User?", style: MyTextStyle.newText),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterClass()));
                        },
                        child: Text("Register", style: MyTextStyle.newText))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
