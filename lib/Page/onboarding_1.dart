import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suaranabawiy/Widget/onboarding_item.dart';
import 'package:suaranabawiy/theme.dart';

class OnBoardingPage1 extends StatefulWidget {
  const OnBoardingPage1({super.key});

  @override
  State<OnBoardingPage1> createState() => _OnBoardingPage1State();
}

class _OnBoardingPage1State extends State<OnBoardingPage1> {
  int currentIndex = 0; // membuat index di mulainya
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     stops: [0.1, 0.9],
          //     colors: [
          //       Color(0xff4B6CB7),
          //       // Color(0xff334C83),
          //       Color(0xff182848),
          //     ],
          //   ),
          // ),
          child: Column(
            children: [
              Expanded(
                child: CarouselSlider(
                  items: [
                    OnBoardingItem(
                      imageUrl: 'images/radio1.png',
                      title: 'Suara Nabawiy',
                      subtitle:
                          'Radio Dakwah Islam suaranabaw awasagsahs \n absagsa sahsjajsahskhaksah sja',
                    ),
                    OnBoardingItem(
                        imageUrl: 'images/radio2.png',
                        title: 'Radio Dakawah Islam',
                        subtitle:
                            'Radio Dakwah Islam suaranabaw awasagsahs \n absagsa sahsjajsahskhaksah sja'),
                    OnBoardingItem(
                        imageUrl: 'images/radio3.png',
                        title: 'radio Umat islam',
                        subtitle:
                            'Radio Dakwah Islam suaranabaw awasagsahs \n absagsa sahsjajsahskhaksah sja')
                  ],
                  options: CarouselOptions(
                    height: double.infinity, //agar tidak terjadi error height
                    viewportFraction:
                        1, //agar tulisan tidak tumpul d satu layar antar layer
                    enableInfiniteScroll: false,
                    initialPage: currentIndex,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    }, //supaya bisa dscroll sebanayak tiga saja
                  ),
                  carouselController: controller,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(2);
                      },
                      child: Text(
                        'SKIP',
                        style: darkTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == 0 ? darkColor : greyColor,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == 1 ? darkColor : greyColor,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == 2 ? darkColor : greyColor,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == 2) {
                          Navigator.pushNamed(context, '/sign-in');
                        } else {
                          controller.nextPage();
                        }
                      },
                      child: Text(
                        'NEXT',
                        style: darkTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
