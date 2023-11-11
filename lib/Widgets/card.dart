import 'package:flutter/material.dart';

class MyCardClass extends StatelessWidget {
  const MyCardClass(
      {Key? key, required this.height, required this.width, required this.txt})
      : super(key: key);
  final double height;
  final double width;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.add,
              color: Colors.orange,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
