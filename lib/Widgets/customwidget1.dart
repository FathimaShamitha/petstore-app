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
      color: Colors.orange[100],
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            SizedBox(height: 20,),
            CircleAvatar(radius: 60,backgroundImage: NetworkImage(imageUrl),),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${price} INR',
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
