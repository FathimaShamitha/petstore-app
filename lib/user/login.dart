import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/admin/view/adminhome.dart';
import 'package:petstore/user/register.dart';
import 'package:petstore/user/userhome.dart';
import 'package:petstore/utilities/constants.dart';

import '../admin/adminmain.dart';

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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  "LogIn",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.orange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
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
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        var auth_ref = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        User? user = auth_ref.user;
                        if(user!.uid == MyConstants().adminID){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHomeClass()));
                        }else{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeClass()));
                        }
                        Fluttertoast.showToast(msg: "Logged In");
                      } on FirebaseAuthException catch (e) {
                        Fluttertoast.showToast(
                            msg: "Enter valid Email and Password");
                      }
                    }
                  },
                  child: Text(
                    "LogIn",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New User?",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterClass()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
