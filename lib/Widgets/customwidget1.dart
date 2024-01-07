import 'package:flutter/material.dart';
import 'package:petstore/utilities/colors.dart';
import 'package:petstore/utilities/textstyles.dart';

class MyColumnClass extends StatelessWidget {
  const MyColumnClass(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.price})
      : super(key: key);
  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 65,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: MyAppColor.primaryColor1,
            ),
            Text(name, style: MyTextStyle.titleText),
            Text(
              '${price} INR',
              style: MyTextStyle.subText,
            )
          ],
        ),
      ),
    );
  }
}
