import 'package:flutter/material.dart';
import 'package:petstore/utilities/textstyles.dart';

class MyCustomTextClass extends StatelessWidget {
  const MyCustomTextClass({Key? key, required this.txt}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
      child: Text(txt, style: MyTextStyle.titleText),
    );
  }
}
