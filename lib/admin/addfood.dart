import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petstore/Widgets/appbar.dart';

import '../Widgets/simpletextfield.dart';

class AddFoodsClass extends StatefulWidget {
  const AddFoodsClass({Key? key}) : super(key: key);

  @override
  State<AddFoodsClass> createState() => _AddFoodsClassState();
}

class _AddFoodsClassState extends State<AddFoodsClass> {
  File? image;
  List<String> FoodCategory = ["Dog Food", "Cat Food"];
  String selectedCategory = "Dog Food";
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quntityController = TextEditingController();

  void addFoodPic() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBarClass(),
      body: SingleChildScrollView(
        child: Container(
          height: ht,
          width: wth,
          child: Column(
            children: [
              image == null
                  ? Container(
                      height: ht / 3,
                      width: wth,
                      child: InkWell(
                        onTap: addFoodPic,
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                    )
                  : Container(
                      height: ht / 3,
                      width: wth,
                      child: Image(
                        image: FileImage(image!),
                      ),
                    ),
              Divider(),
              Row(children: [
                Expanded(
                    child: MyTextFieldClass(
                  hinttxt: 'Name',
                  controller: nameController,
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 3),
                  child: Text(
                    "Type :",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 3),
                  child: DropdownButton(
                    value: selectedCategory,
                    items: FoodCategory.map((String c) {
                      return DropdownMenuItem(
                        child: Text(c),
                        value: c,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value.toString();
                      });
                    },
                  ),
                ),
              ]),
              MyTextFieldClass(
                hinttxt: 'Price',
                controller: priceController,
              ),
              MyTextFieldClass(
                hinttxt: 'Quantity',
                controller: quntityController,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
