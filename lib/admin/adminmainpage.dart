import 'package:flutter/material.dart';
import 'package:petstore/admin/petsviewpage.dart';
import 'package:petstore/admin/usersviewpage.dart';

import 'adminhomepage.dart';

class AdminMainClass extends StatefulWidget {
  const AdminMainClass({Key? key}) : super(key: key);

  @override
  State<AdminMainClass> createState() => _AdminMainClassState();
}

class _AdminMainClassState extends State<AdminMainClass> {
  int currentIndex = 1;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  void pageChange(index) {
    setState(() {
      currentIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: pageChange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pets,
                color: Colors.orange,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: Colors.orange,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                color: Colors.orange,
              ),
              label: ""),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [PetsViewClass(), AdminHomeClass(), UserViewClass()],
      ),
    );
  }
}
