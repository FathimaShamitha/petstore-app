import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class HomeAppBarClass extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarClass({Key? key, required this.func}) : super(key: key);
  final Function func;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text(
        MyConstants().appTitle,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        InkWell(
          onTap: () {
            func();
          },
          child: Icon(
            Icons.logout,
            color: Colors.white,
            size: 20,
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}
