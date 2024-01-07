/*
import 'package:flutter/material.dart';

import '../../Widgets/simpletab.dart';
import '../../utilities/constants.dart';
import 'adminallfoodsview.dart';
import 'admincatfoodview.dart';
import 'admindogfoodview.dart';

class FoodViewClass extends StatelessWidget {
  const FoodViewClass({Key? key}) : super(key: key);

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
                MyTabClass(title: 'DogFood'),
                MyTabClass(title: 'CatFood')
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [
              AdminAllFoodClass(),
              AdminDogFoodViewClass(),
              AdminCatFoodViewClass()
            ],
          ),
        ));
  }
}
*/
