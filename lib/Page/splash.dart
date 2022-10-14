import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:suaranabawiy/Model/background.dart';
import 'package:suaranabawiy/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding1', (route) => false);
      },
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
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
    );
  }
}
