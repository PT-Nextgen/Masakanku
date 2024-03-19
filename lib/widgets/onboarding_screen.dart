import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen(
      {super.key,
      this.color,
      required this.image,
      required this.title,
      required this.description});

  Color? color;
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 26,
        ),
        color: color ?? Colors.white,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 360,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 26,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
