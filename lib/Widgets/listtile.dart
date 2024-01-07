import 'package:flutter/material.dart';

class MyListTileClass extends StatelessWidget {
  const MyListTileClass({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.func,
  }) : super(key: key);
  final String image;
  final String name;
  final String price;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Card(
        child: ListTile(
          leading: SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )),
          title: Text(
            name,
          ),
          subtitle: Text("${price} INR"),
          trailing: InkWell(
              onTap: () {
                func();
              },
              child: const Icon(
                Icons.delete,
              )),
        ),
      ),
    );
  }
}
