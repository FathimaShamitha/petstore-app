import 'package:flutter/material.dart';
import 'package:petstore/utilities/constants.dart';

class MyAppBarClass extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text(
        MyConstants().appTitle,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}