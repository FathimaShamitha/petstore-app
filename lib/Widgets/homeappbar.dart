import 'package:flutter/material.dart';
import 'package:petstore/utilities/colors.dart';

import '../utilities/constants.dart';

class HomeAppBarClass extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarClass({Key? key, required this.func}) : super(key: key);
  final Function func;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(MyConstants().appTitle,),
      actions: [
        InkWell(
          onTap: () {
            func();
          },
          child: const Icon(
            Icons.logout,
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
