import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;
  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefalutPadding),
      child: Column(
        children: [
          Image.asset(
            imageURL,
            width: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
