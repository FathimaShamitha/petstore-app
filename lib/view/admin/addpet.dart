import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:petstore/controller/admincontroller.dart';
import 'package:provider/provider.dart';

import '../../Widgets/simpletextfield.dart';
import '../../controller/imagecontroller.dart';
import '../../utilities/constants.dart';

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
    final petDetailsObj = Provider.of<AdminController>(context);
    final imageObj = Provider.of<ImageUpload>(context);
    final double ht = MediaQuery.of(context).size.height;
    final double wth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBarClass(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageObj.myImage == null
                ? Container(
                    height: ht / 3,
                    width: wth,
                    child: InkWell(
                      onTap: () {
                        imageObj.uploadImage();
                      },
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                      ),
                    ),
                  )
                : Container(
                    height: ht / 3,
                    width: wth,
                    child: Image(
                      image: FileImage(imageObj.myImage!),
                    ),
                  ),
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
            MyTextFieldClass(
              hinttxt: 'Breed',
              controller: breedController,
              type: TextInputType.text,
            ),
            MyTextFieldClass(
              hinttxt: 'Age',
              controller: ageController,
              type: TextInputType.text,
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
              type: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () async {
                  var imgRef = await FirebaseStorage.instance
                      .ref()
                      .child("MyImages/${imageObj.myImage!.path}");
                  task = imgRef.putFile(imageObj.myImage!);
                  final snap = await task!.whenComplete(() {});
                  var imageUrl = await snap.ref.getDownloadURL();
                  petDetailsObj.addPetDetails(
                      selectedCategory,
                      breedController.text,
                      selectedColor,
                      ageController.text,
                      gender,
                      priceController.text,
                      imageUrl);
                  Fluttertoast.showToast(msg: "Added Successfully");
                  setState(() {
                    imageObj.myImage = null;
                    breedController.clear();
                    ageController.clear();
                    priceController.clear();
                  });
                },
                child: const Text(
                  "Add",
                ))
          ],
        ),
      ),
    );
  }
}
