import 'package:flutter/material.dart';

class MyListTileClass extends StatelessWidget {
  const MyListTileClass({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
  }) : super(key: key);
  final String image;
  final String name;
  final String price;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          height: 50,
          width: 50,
          child: Image(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
          ),
          Text(
            price,
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(qty),
        ],
      ),
    );
  }
}
