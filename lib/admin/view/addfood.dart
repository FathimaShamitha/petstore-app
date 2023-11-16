import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petstore/Widgets/appbar.dart';
import 'package:provider/provider.dart';

import '../../Widgets/simpletextfield.dart';
import '../../utilities/constants.dart';
import '../controller/addfoodcontroller.dart';
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
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    final imgObj = Provider.of<ImageUpload>(context);
    final foodDetailsObj = Provider.of<AddFoodDetailsClass>(context);
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
                      onTap: () => imgObj.uploadImage(),
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
                  value: selectedType,
                  items: MyConstants().foodType.map((String c) {
                    return DropdownMenuItem(
                      child: Text(c),
                      value: c,
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
                hinttxt: 'Category', controller: categoryController),
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
                    var img_ref = await FirebaseStorage.instance
                        .ref()
                        .child("MyFoodImages/${imgObj.image!.path}");
                    task = img_ref.putFile(imgObj.image!);
                    final snap = await task!.whenComplete(() {});
                    var imageurl = await snap.ref.getDownloadURL();
                    foodDetailsObj.addFoodDetails(
                        nameController.text,
                        selectedType,
                        categoryController.text,
                        priceController.text,
                        quantityController.text,
                        imageurl);
                    setState(() {
                      imgObj.image = null;
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
    );
  }
}
