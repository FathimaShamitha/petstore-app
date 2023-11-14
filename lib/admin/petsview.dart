import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'adminallpetsview.dart';
import 'admincatsview.dart';
import 'admindogsview.dart';

class PetsViewClass extends StatefulWidget {
  const PetsViewClass({Key? key}) : super(key: key);

  @override
  State<PetsViewClass> createState() => _PetsViewClassState();
}

class _PetsViewClassState extends State<PetsViewClass> {
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
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "Dogs",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "cats",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            AdminAllPetsClass(),
            AdminDogsViewClass(),
            AdminCatsViewClass(),
          ],
        ),
      ),
    );
  }
}
