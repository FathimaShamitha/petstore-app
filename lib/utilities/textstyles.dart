import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextStyle {
  static TextStyle mainText = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40,
      color: MyAppColor.primaryColor);
  static TextStyle quoteText = TextStyle(
      color: MyAppColor.primaryColor,
      fontSize: 20,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);
  static TextStyle appBarText =
      TextStyle(fontSize: 25, color: MyAppColor.primaryColor3);
  static TextStyle headLineText = TextStyle(
      color: MyAppColor.primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.bold);
  static TextStyle tabText =
      TextStyle(fontSize: 18, color: MyAppColor.primaryColor3);
  static TextStyle bodyText =
      TextStyle(fontSize: 18, color: MyAppColor.primaryColor4);
  static TextStyle buttonText =
      TextStyle(fontSize: 20, color: MyAppColor.primaryColor3);
  static TextStyle titleText =
      TextStyle(fontSize: 18, color: MyAppColor.primaryColor);
  static TextStyle subText =
      TextStyle(fontSize: 15, color: MyAppColor.primaryColor);
  static TextStyle headText = TextStyle(
      color: MyAppColor.primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static TextStyle bigText = TextStyle(fontSize: 20);
  static TextStyle smallText = TextStyle(fontSize: 18);
  static TextStyle newText = TextStyle(fontSize: 15, color: Colors.blue);
}
