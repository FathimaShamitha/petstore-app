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

class AddPetsClass extends StatefulWidget {
  const AddPetsClass({Key? key}) : super(key: key);

  @override
  State<AddPetsClass> createState() => _AddPetsClassState();
}

class _AddPetsClassState extends State<AddPetsClass> {
  UploadTask? task;
  String gender = "";
  String selectedCategory = "Dog";
  String selectedColor = "Black";
  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imgObj = Provider.of<ImageUpload>(context);
    final petDetailsObj = Provider.of<AddDetails>(context);
    return Scaffold(
      appBar: const MyAppBarClass(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyCarouselSlider(),
            const Divider(),
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                child: Text(
                  "Type :",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: DropdownButton(
                  value: selectedCategory,
                  items: MyConstants().petType.map((String c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value.toString();
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                child: Text(
                  "Fur Colour :",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: DropdownButton(
                    value: selectedColor,
                    items: MyConstants().furColor.map((String f) {
                      return DropdownMenuItem(
                        value: f,
                        child: Text(f),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedColor = value.toString();
                      });
                    }),
              )
            ]),
            MyTextFieldClass(hinttxt: 'Breed', controller: breedController),
            MyTextFieldClass(
              hinttxt: 'Age',
              controller: ageController,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Gender :",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: RadioMenuButton(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      child: const Text("Male")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: RadioMenuButton(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      child: const Text("Female")),
                )
              ],
            ),
            MyTextFieldClass(
              hinttxt: 'Price',
              controller: priceController,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () async {
                  imgObj.uploadImage();
                  petDetailsObj.addPetDetails(
                      selectedCategory,
                      breedController.text,
                      selectedColor,
                      ageController.text,
                      gender,
                      priceController.text,
                      imgObj.imageUrl);
                  Fluttertoast.showToast(msg: "Added Successfully");
                  setState(() {
                    imgObj.image.clear();
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
