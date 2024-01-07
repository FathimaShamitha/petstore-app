import 'package:flutter/material.dart';
import 'package:petstore/utilities/textstyles.dart';

class MyUserHeadClass extends StatelessWidget {
  const MyUserHeadClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        height: ht * 0.3,
        width: wth,
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/homeview.jpg"),
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text("Find Your Best Companion With Us",
                    style: MyTextStyle.quoteText)),
          ],
        ),
      ),
    );
  }
}
