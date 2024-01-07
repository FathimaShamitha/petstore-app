import 'package:flutter/material.dart';
import 'package:petstore/utilities/textstyles.dart';

class MyTabClass extends StatelessWidget {
  const MyTabClass({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: MyTextStyle.tabText
      ),
    );
  }
}
