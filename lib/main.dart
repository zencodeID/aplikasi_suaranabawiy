import 'package:flutter/material.dart';
import 'package:suaranabawiy/Page/onboarding_1.dart';
import 'package:suaranabawiy/Page/signin_page.dart';
import 'package:suaranabawiy/Page/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding1': (context) => OnBoardingPage1(),
        '/sign-in': (context) => SignInPage(),
      },
    );
  }
}
