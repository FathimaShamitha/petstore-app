import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petstore/utilities/constants.dart';
import 'package:petstore/utilities/textstyles.dart';

class MyCarouselClass extends StatefulWidget {
  const MyCarouselClass({Key? key}) : super(key: key);

  @override
  State<MyCarouselClass> createState() => _MyCarouselClassState();
}

class _MyCarouselClassState extends State<MyCarouselClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CarouselSlider.builder(
            itemCount: MyConstants().petImages.length,
            itemBuilder: (context, index, realindex) {
              return Card(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(MyConstants().petImages[index]),
                              fit: BoxFit.fitWidth)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(MyConstants().petNames[index],
                        style: MyTextStyle.headText)
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
            )),
      ),
    );
  }
}
