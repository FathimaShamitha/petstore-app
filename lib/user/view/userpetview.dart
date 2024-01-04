import 'package:flutter/material.dart';
import 'package:petstore/Widgets/simpletab.dart';
import 'package:petstore/user/view/userallpetsview.dart';
import 'package:petstore/user/view/usercatsview.dart';
import 'package:petstore/user/view/userdogsview.dart';
import 'package:petstore/utilities/colors.dart';

import '../../utilities/constants.dart';

class UserPetsViewClass extends StatelessWidget {
  const UserPetsViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyAppColor.primaryColor,
            title: Text(
              MyConstants().appTitle,
            ),
            bottom: const TabBar(
              tabs: [
                MyTabClass(title: 'All'),
                MyTabClass(title: 'Dogs'),
                MyTabClass(title: 'Cats'),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [
              UserAllPetsClass(),
              UserDogViewClass(),
              UserCatViewClass()
            ],
          ),
        ));
  }
}
