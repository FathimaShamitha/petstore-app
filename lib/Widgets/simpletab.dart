import 'package:flutter/material.dart';

class MyTabClass extends StatelessWidget {
  const MyTabClass({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
