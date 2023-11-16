import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:provider/provider.dart';

import '../../Widgets/simpletextfield.dart';
import '../../utilities/constants.dart';
import '../controller/addpetscontroller.dart';
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
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    final imgObj = Provider.of<ImageUpload>(context);
    final petDetailsObj = Provider.of<AddPetsDetails>(context);
    return Scaffold(
      appBar: MyAppBarClass(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imgObj.image == null
                ? Container(
                    height: ht / 3,
                    width: wth,
                    child: InkWell(
                      onTap: () {
                        imgObj.uploadImage();
                      },
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
                      image: FileImage(imgObj.image!),
                    ),
                  ),
            Divider(),
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
                  items: MyConstants().petType.map((String c) {
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
                    items: MyConstants().furColor.map((String f) {
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
            MyTextFieldClass(hinttxt: 'Breed', controller: breedController),
            MyTextFieldClass(
              hinttxt: 'Age',
              controller: ageController,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
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
                      child: Text("Male")),
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
                      child: Text("Female")),
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
                  var img_ref = await FirebaseStorage.instance
                      .ref()
                      .child("MyImages/${imgObj.image!.path}");
                  task = img_ref.putFile(imgObj.image!);
                  final snap = await task!.whenComplete(() {});
                  var imageurl = await snap.ref.getDownloadURL();
                  petDetailsObj.addPetDetails(
                      selectedCategory,
                      breedController.text,
                      selectedColor,
                      ageController.text,
                      gender,
                      priceController.text,
                      imageurl);
                  Fluttertoast.showToast(msg: "Added Successfully");
                  setState(() {
                    imgObj.image = null;
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
