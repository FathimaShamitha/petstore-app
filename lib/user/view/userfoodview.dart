import 'package:flutter/material.dart';
import 'package:petstore/Widgets/simpletab.dart';
import 'package:petstore/user/view/userallfoodsview.dart';
import 'package:petstore/user/view/usercatfoodview.dart';
import 'package:petstore/user/view/userdogfoodview.dart';

import '../../utilities/constants.dart';

class UserFoodViewClass extends StatelessWidget {
  const UserFoodViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            MyConstants().appTitle,
            style: const TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            tabs: [
              MyTabClass(title: 'All'),
              MyTabClass(title: 'Dog Foods'),
              MyTabClass(title: 'Cat Foods'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserAllFoodsClass(),
            UserDogFoodClass(),
            UserCatFoodView()
          ],
        ),
      ),
    );
  }
}
