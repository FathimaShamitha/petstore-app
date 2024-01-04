import 'package:flutter/material.dart';
import 'package:petstore/utilities/textstyles.dart';

class MyCardClass extends StatelessWidget {
  const MyCardClass(
      {Key? key,
      required this.height,
      required this.width,
      required this.txt,
      required this.myIcon})
      : super(key: key);
  final double height;
  final double width;
  final String txt;
  final IconData myIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: MyTextStyle.titleText,
            ),
            Icon(
              myIcon,
            )
          ],
        ),
      ),
    );
  }
}
