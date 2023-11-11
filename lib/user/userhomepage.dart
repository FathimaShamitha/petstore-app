import 'package:flutter/material.dart';
import 'package:petstore/Widgets/appbar.dart';

class HomeClass extends StatefulWidget{
  @override
  State<HomeClass> createState()=> HomeClassState();
}

class HomeClassState extends State<HomeClass>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBarClass()
    );
  }
}