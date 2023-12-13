import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:petstore/Widgets/carouselslider.dart';
import 'package:provider/provider.dart';

import '../../Widgets/simpletextfield.dart';
import '../../utilities/constants.dart';
import '../controller/adddetailscontroller.dart';
import '../controller/imagecontroller.dart';

class AddFoodClass extends StatefulWidget {
  const AddFoodClass({Key? key}) : super(key: key);

  @override
  State<AddFoodClass> createState() => _AddFoodClassState();
}

class _AddFoodClassState extends State<AddFoodClass> {
  UploadTask? task;
  String selectedType = "Dog Food";
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final foodDetailsObj = Provider.of<AddDetails>(context);
    final imageObj = Provider.of<ImageUpload>(context);
    return Scaffold(
      appBar: const MyAppBarClass(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyCarouselSlider(),
            const Divider(),
            MyTextFieldClass(hinttxt: 'Name', controller: nameController),
            Row(children: [
              Expanded(
                  child: MyTextFieldClass(
                hinttxt: 'Category',
                controller: categoryController,
              )),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 3),
                child: Text(
                  "Type :",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 3),
                child: DropdownButton(
                  value: selectedType,
                  items: MyConstants().foodType.map((String c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value.toString();
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
              controller: quantityController,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 3),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () async {
                    imageObj.uploadImage();
                    foodDetailsObj.addFoodDetails(
                        nameController.text,
                        selectedType,
                        categoryController.text,
                        priceController.text,
                        quantityController.text,
                        imageObj.imageUrl.toList());
                    setState(() {
                      imageObj.image.clear();
                    });
                    Fluttertoast.showToast(msg: "Added Successfully");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
