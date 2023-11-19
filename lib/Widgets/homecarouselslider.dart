import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class MyCarouselClass extends StatefulWidget {
  const MyCarouselClass({Key? key}) : super(key: key);

  @override
  State<MyCarouselClass> createState() => _MyCarouselClassState();
}

class _MyCarouselClassState extends State<MyCarouselClass> {
  final carouselList = [
    "assets/images/homwview4.jpg",
    "assets/images/homwview3.jpg",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.orange),
        child: Stack(
          children: [
            CarouselSlider.builder(
                itemCount: carouselList.length,
                itemBuilder: (context, index, realindex) {
                  return Image(
                    image: AssetImage(carouselList[index]),
                    fit: BoxFit.fitHeight,
                  );
                },
                options: CarouselOptions(
                    viewportFraction: 2,
                    disableCenter: true,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    })),
            Positioned(
                left: 20,
                right: 20,
                bottom: 5,
                child: DotsIndicator(
                  dotsCount: carouselList.length,
                  position: currentIndex,
                ))
          ],
        ),
      ),
    );
  }
}
