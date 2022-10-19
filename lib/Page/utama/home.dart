import 'package:flutter/material.dart';
import 'package:suaranabawiy/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suara Nabawiy 107.7 FM'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.6, 0.9],
              colors: [
                Color(0xff4B6CB7),
                Color(0xff334C83),
                Color(0xff182848),
              ],
            ),
          ),
          // child: ListView(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(top: 90),
          //       height: 211,
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('images/sn.png'),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 12,
          //     ),
          //     Center(
          //       child: Container(
          //         height: 18,
          //         width: 60,
          //         color: redColor,
          //         child: Text(
          //           'Online',
          //           style: whiteTextStyle.copyWith(
          //             fontSize: 12,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Text('Habib Taufiq Assegaf'),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text('Kalam Salam'),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Text(
          //         "Kajian kitab  Ta’lim Wa Muta’alim Karya Syeikh Hasyim Asy’ari"),
          //   ],
          // ),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CustomPaint(
              //   painter: BackgroundPainter(),
              //   child: Container(
              //     width: double.infinity,
              //     height: double.infinity,
              //   ),
              // ),
              Container(
                height: 180,
                width: 180,
                margin: EdgeInsets.only(bottom: 50, top: 250),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/sn.png'),
                  ),
                ),
              ),
              Text(
                'SUARA NABAWIY 107.7 FM',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Damaikan Hati ,  Sejukan Jiwa',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
