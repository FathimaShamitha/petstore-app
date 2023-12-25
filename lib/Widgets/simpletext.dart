import 'package:flutter/material.dart';

class MyTextClass extends StatelessWidget {
  const MyTextClass({Key? key, required this.title, required this.content,}) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
      child: Text( "$title : $content", style: const TextStyle(fontSize:20 ),),
    );
  }
}
