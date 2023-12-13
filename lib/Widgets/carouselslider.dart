import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../admin/controller/imagecontroller.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wth = MediaQuery.of(context).size.width;
    final imgObj = Provider.of<ImageUpload>(context);
    return Container(
      height: ht / 3,
      width: wth,
      child: Stack(
        children: [
          imgObj.image.isEmpty
              ? Container(
                  height: ht / 3,
                  width: wth,
                  child: InkWell(
                    onTap: () {
                      Provider.of<ImageUpload>(context, listen: false)
                          .getImage();
                    },
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 40,
                      color: Colors.orange,
                    ),
                  ),
                )
              : CarouselSlider.builder(
                  itemCount: imgObj.image.length,
                  itemBuilder: (context, index, realindex) {
                    return Image(image: FileImage(imgObj.image[index]));
                  },
                  options: CarouselOptions(onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          Positioned(
              left: 20,
              right: 20,
              bottom: 5,
              child: imgObj.image.isEmpty
                  ? const SizedBox(
                      height: 10,
                      width: 10,
                    )
                  : DotsIndicator(
                      dotsCount: imgObj.image.length,
                      position: currentIndex,
                    ))
        ],
      ),
    );
  }
}
