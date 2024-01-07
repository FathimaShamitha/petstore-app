import 'package:flutter/material.dart';
import 'package:petstore/utilities/colors.dart';

import '../utilities/textstyles.dart';

class MyHeadingClass extends StatelessWidget {
  const MyHeadingClass({Key? key, required this.txt}) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: CircleAvatar(
            backgroundColor: MyAppColor.primaryColor1,
              radius: 100,
              backgroundImage: AssetImage("assets/images/cat_dog.jpg")),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            txt,
            style: MyTextStyle.mainText,
          ),
        ),
      ],
    );
  }
}
