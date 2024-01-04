import 'package:flutter/material.dart';
import 'package:petstore/utilities/textstyles.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: MyAppColor.primaryColor,
        titleTextStyle: MyTextStyle.appBarText,
        centerTitle: true),
    iconTheme: IconThemeData(color: MyAppColor.primaryColor2, size: 20),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(MyAppColor.primaryColor2),
      textStyle: MaterialStatePropertyAll(MyTextStyle.buttonText),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    )),
    cardTheme: CardTheme(
        color: MyAppColor.primaryColor2,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    textTheme: TextTheme(bodyMedium: MyTextStyle.bodyText),
    dividerTheme:
        DividerThemeData(color: MyAppColor.primaryColor, thickness: 1),
    listTileTheme: ListTileThemeData(
        titleTextStyle: MyTextStyle.listTileText,
        subtitleTextStyle: MyTextStyle.listTileText,
        iconColor: MyAppColor.primaryColor2,
        textColor: MyAppColor.primaryColor4),
    dialogTheme: DialogTheme(
        backgroundColor: MyAppColor.primaryColor3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: MyTextStyle.bodyText),
  );
}
