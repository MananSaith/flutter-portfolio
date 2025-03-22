import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constatnts/sized_box_extension.dart';
import 'package:portfolio_website/views/home/controller/home_controller.dart';

import '../constatnts/app_constants.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: Get.width,
      color: const Color(0xff31333B),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(height: 3, color: scaffoldColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Contact Me',
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      speed: const Duration(milliseconds: 400),
                    ),
                    TypewriterAnimatedText(
                      'Contact Me',
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      speed: const Duration(milliseconds: 400),
                    ),
                  ],
                  onTap: () {},
                ),
              ),
              Expanded(
                child: Container(height: 3, color: scaffoldColor),
              ),
            ],
          ),
          20.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  homeController.launchEmail('mrmanan143@gmail.com');
                },
                child: contactContainer(
                    Icons.email_outlined, 'mrmanan143@gmail.com'),
              ),
              10.w,
              // Expanded(
              //   flex: 1,

              // ),
            ],
          ),
          15.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  homeController.launchPhoneDialer('+92 3174689617');
                },
                child: contactContainer(
                    Icons.phone_in_talk_outlined, '+92 3174689617 '),
              ),
            ],
          ),
          20.h,
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(height: 3, color: scaffoldColor),
                ),
                10.w,
                GestureDetector(
                  onTap: () {
                    homeController.launchURL(
                        'https://www.linkedin.com/in/abdul-manan-8a9202240/');
                  },
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/l.png')),
                ),
                10.w,
                GestureDetector(
                  onTap: () {
                    homeController
                        .launchURL('https://github.com/MananSaith');
                  },
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/g.png')),
                ),
                10.w,
                GestureDetector(
                  onTap: () {
                    homeController.launchWhatsAppUri();
                  },
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/w.png')),
                ),
                10.w,
                Expanded(
                  child: Container(height: 3, color: scaffoldColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget contactContainer(IconData icon, String text) {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
          color: scaffoldColor, boxShadow: [BoxShadow(offset: Offset(10, 10))]),
      //  width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(icon),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  text,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
