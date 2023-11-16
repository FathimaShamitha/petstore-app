import 'package:flutter/material.dart';

class MySimpleListTileClass extends StatelessWidget {
  const MySimpleListTileClass({Key? key, required this.myicon, required this.title}) : super(key: key);
  final IconData myicon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        myicon,
        color: Colors.orange,
      ),
      title: Text(title),
    );
  }
}
