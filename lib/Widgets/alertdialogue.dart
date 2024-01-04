import 'package:flutter/material.dart';

class MyAlertDialogueClass extends StatelessWidget {
  const MyAlertDialogueClass(
      {Key? key,
      required this.title,
      required this.content,
      required this.yes,
      required this.no,
      required this.onYesPressed,
      required this.onNoPressed})
      : super(key: key);
  final String title;
  final String content;
  final String yes;
  final String no;
  final Function onYesPressed;
  final Function onNoPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        /*style: const TextStyle(fontSize: 18),*/
      ),
      content: Text(
        content,
        /*style: const TextStyle(fontSize: 15),*/
      ),
      /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),*/
      actions: [
        TextButton(
            onPressed: () {
              onNoPressed();
            },
            child: Text(
              no,
              /*style: const TextStyle(color: Colors.purple),*/
            )),
        TextButton(
            onPressed: () {
              onYesPressed();
            },
            child: Text(
              yes,
              /*style: const TextStyle(color: Colors.purple),*/
            )),
      ],
    );
  }
}
