import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constatnts/app_constants.dart';
import '../views/home/controller/home_controller.dart';

class MainMobile extends StatelessWidget {
  MainMobile({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          // horizontal: 40.0,
          // vertical: 30.0,
          ),
      // height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 570.0,
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/mobile_profile_image.png",
            width: Get.width,
            fit: BoxFit.cover,
          ),

          // intro message
          Positioned(
            top: 20,
            left: 30,
            child: AnimatedTextKit(
              repeatForever: true,
              totalRepeatCount: 8,
              animatedTexts: [
                ColorizeAnimatedText(
                  "Hi,\nI'm Abdulmanan\nA Flutter Developer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(seconds: 01),
                  colors: [
                    const Color.fromRGBO(255, 255, 255, 1),
                    const Color.fromARGB(255, 126, 123, 123),
                    const Color.fromARGB(255, 2, 27, 72),
                    const Color.fromARGB(255, 60, 5, 240)
                  ],
                ),
                ColorizeAnimatedText(
                  "Hi,\nI'm Abdulmanan\nA Flutter Developer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(seconds: 01),
                  colors: [
                    const Color.fromRGBO(255, 255, 255, 1),
                    const Color.fromARGB(255, 126, 123, 123),
                    const Color.fromARGB(255, 2, 27, 72),
                    const Color.fromARGB(255, 60, 5, 240)
                  ],
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                if (kDebugMode) {
                  print("Tap Event");
                }
              },
            ),
          ),

          // contact btn
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: SizedBox(
                width: 150.0,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [appPrimaryColor, appPrimaryColor2],
                      ),
                    ),
                    child: Center(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Get in touch',
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            speed: const Duration(milliseconds: 400),
                          ),
                          TypewriterAnimatedText(
                            'Get in touch',
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            speed: const Duration(milliseconds: 400),
                          ),
                        ],
                        onTap: () {},
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
            bottom: 6,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      homeController.launchURL(
                          'https://www.linkedin.com/in/abdul-manan-8a9202240/');
                    },
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/l.png')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      homeController.launchURL('https://github.com/MananSaith');
                    },
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/g.png')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      homeController.launchWhatsAppUri();
                    },
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/w.png')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
