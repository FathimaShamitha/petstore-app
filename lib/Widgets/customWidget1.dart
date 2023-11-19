import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 2,
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
