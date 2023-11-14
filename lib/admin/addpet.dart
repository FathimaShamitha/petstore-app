import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/appbar.dart';
import '../Widgets/simpletextfield.dart';

class AddPetsClass extends StatefulWidget {
  const AddPetsClass({Key? key}) : super(key: key);

  @override
  State<AddPetsClass> createState() => _AddPetsClassState();
}

class _AddPetsClassState extends State<AddPetsClass> {
  List<String> PetType = ["Dog", "Cat"];
  List<String> FurColor = [
    "Black",
    "Brown",
    "White",
    "Cream",
    "Golden",
    "Red",
    "Grey"
  ];
  String selectedCategory = "Dog";
  String selectedColor = "Black";
  File? image;
  UploadTask? task;

  TextEditingController breedController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  void addPetPic() async {
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
                        onTap: addPetPic,
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
              MyTextFieldClass(hinttxt: 'Breed', controller: breedController),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(
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
                    items: PetType.map((String c) {
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Text(
                    "Fur Colour :",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: DropdownButton(
                      value: selectedColor,
                      items: FurColor.map((String f) {
                        return DropdownMenuItem(
                          child: Text(f),
                          value: f,
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
                hinttxt: 'Age',
                controller: ageController,
              ),
              MyTextFieldClass(
                hinttxt: 'Gender',
                controller: genderController,
              ),
              MyTextFieldClass(
                hinttxt: 'Price',
                controller: priceController,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () async {
                      var img_ref = await FirebaseStorage.instance
                          .ref()
                          .child("MyImages/${image!.path}");
                      task = img_ref.putFile(image!);
                      final snap = await task!.whenComplete(() {});
                      var imageurl = await snap.ref.getDownloadURL();
                      var db_ref = await FirebaseFirestore.instance
                          .collection("Pets")
                          .add({
                        "type": selectedCategory,
                        "breed": breedController.text,
                        "fur": selectedColor,
                        "age": ageController.text,
                        "gender": genderController.text,
                        "price": priceController.text,
                        "imageurl": imageurl
                      });
                      Fluttertoast.showToast(msg: "Added Successfully");
                      Navigator.pop(context);
                    },
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
