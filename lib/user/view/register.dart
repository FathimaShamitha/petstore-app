import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../home/login.dart';

class RegisterClass extends StatefulWidget {
  State<RegisterClass> createState() => RegisterClassState();
}

class RegisterClassState extends State<RegisterClass> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image(
                    image: AssetImage("assets/images/cat_dog.jpg"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty!!!";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty!!!";
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
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty!!!";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty!!!";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "PhoneNo",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          var ref = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          User? user = ref.user;
                          if (user != null) {
                            var dbRef = FirebaseFirestore.instance
                                .collection("Users")
                                .add({
                              "username": nameController.text,
                              "email": emailController.text,
                              "password": passwordController.text,
                              "phone_no": phoneController.text,
                              "uid": user.uid
                            });
                          }
                          Fluttertoast.showToast(
                              msg: "Registered successfully");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginClass()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "invalid-email") {
                            Fluttertoast.showToast(msg: "Invaild Email Format");
                          }
                          if (e.code == "weak-password") {
                            Fluttertoast.showToast(
                                msg: "Enter a strong password");
                          }
                          if (e.code == "email-already-in-use") {
                            Fluttertoast.showToast(msg: "Email already exists");
                          }
                        } catch (e) {
                          Fluttertoast.showToast(msg: "Register Failled");
                        }
                      }
                    },
                    child: const Text(
                      "Register",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
