import 'package:flutter/material.dart';

class PetsViewClass extends StatefulWidget {
  const PetsViewClass({Key? key}) : super(key: key);

  @override
  State<PetsViewClass> createState() => _PetsViewClassState();
}

class _PetsViewClassState extends State<PetsViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
    );
  }
}
