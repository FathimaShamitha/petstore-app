import 'package:flutter/material.dart';
import 'package:petstore/utilities/textstyles.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: MyAppColor.primaryColor,
        titleTextStyle: MyTextStyle.appBarText,
        centerTitle: true),
    iconTheme: IconThemeData(color: MyAppColor.primaryColor, size: 25),
    brightness: Brightness.light,
    shadowColor: MyAppColor.primaryColor,
    hoverColor: MyAppColor.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(MyAppColor.primaryColor2),
      textStyle: MaterialStatePropertyAll(MyTextStyle.buttonText),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    )),
    cardTheme: CardTheme(
        color: MyAppColor.primaryColor3,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    dividerTheme:
        DividerThemeData(color: MyAppColor.primaryColor2, thickness: 1),
    listTileTheme: ListTileThemeData(
      tileColor: MyAppColor.primaryColor3,
      titleTextStyle: MyTextStyle.titleText,
      subtitleTextStyle: MyTextStyle.subText,
      iconColor: MyAppColor.primaryColor2,
    ),
    dialogTheme: DialogTheme(
        backgroundColor: MyAppColor.primaryColor3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle: MyTextStyle.bodyText),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyAppColor.primaryColor,
        selectionColor: MyAppColor.primaryColor,
        selectionHandleColor: MyAppColor.primaryColor),
    
  );
}
