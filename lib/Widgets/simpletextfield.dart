import 'package:flutter/material.dart';

class MyTextFieldClass extends StatelessWidget {
  const MyTextFieldClass(
      {Key? key, required this.hinttxt, required this.controller, required this.type})
      : super(key: key);
  final String hinttxt;
  final TextEditingController controller;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 3),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(hintText: hinttxt),
      ),
    );
  }
}
