import 'package:flutter/material.dart';
import 'package:petstore/Widgets/simpletab.dart';
import 'package:petstore/admin/view/adminallpetsview.dart';
import 'package:petstore/admin/view/admincatsview.dart';
import 'package:petstore/admin/view/admindogsview.dart';
import 'package:petstore/utilities/colors.dart';

import '../../utilities/constants.dart';

class PetsViewClass extends StatelessWidget {
  const PetsViewClass({Key? key}) : super(key: key);

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
                MyTabClass(title: 'Cats')
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [
              AdminAllPetsClass(),
              AdminDogsViewClass(),
              AdminCatsViewClass(),
            ],
          ),
        ));
  }
}
