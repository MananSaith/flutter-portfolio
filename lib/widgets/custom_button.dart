import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constatnts/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 50,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
         appPrimaryColor,
         appPrimaryColor2
          ])),
      child: Center(
        child: AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
          animatedTexts: [
            TypewriterAnimatedText(
            text,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              speed: const Duration(milliseconds: 400),
            ),
            TypewriterAnimatedText(
             text,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              speed: const Duration(milliseconds: 400),
            ),
          ],
          onTap: () {},
        ),
      ),
    );
  }
}
