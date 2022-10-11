import 'package:flutter/material.dart';
import 'package:suaranabawiy/theme.dart';

class OnBoardingItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OnBoardingItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Image.asset(
          imageUrl,
          width: double.infinity,
        ),
        SizedBox(
          height: 128,
        ),
        Text(
          title,
          style: darkTextStyle.copyWith(fontSize: 26),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: greyTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
