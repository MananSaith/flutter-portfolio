import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constatnts/app_constants.dart';
import 'package:portfolio_website/constatnts/sized_box_extension.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

class DesktopAboutMeSection extends StatelessWidget {
  const DesktopAboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          40.h,
          const CustomButton(text: 'About Me'),
          Container(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: const Text(
              'Flutter Developer with hands-on experience in mobile application development, including a Flutter Developer role at Aylvah and a Flutter Internship at Advisable Technology. Seeking an opportunity to further hone my skills, contribute to impactful projects, and collaborate with industry professionals. Passionate about building user-centric, scalable, and innovative mobile applications while staying updated with the latest trends and advancements in mobile development.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget experienceWidget(
      String companyName, String des, String name, String date, String city) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: Container()),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // ignore: deprecated_member_use
                                color: appPrimaryColor2.withOpacity(0.3))),
                        Positioned(
                          bottom: 7,
                          left: 7,
                          child: Container(
                            height: 11,
                            width: 11,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: appPrimaryColor2),
                          ),
                        ),
                      ],
                    ),
                    19.h,
                    Container(
                      height: 136,
                      width: 2,
                      color: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          7.w,
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            companyName,
                            //  'at Funzoft Software House',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          3.w,
                          Text(
                            city,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 160, width: 280, child: Text(des))
                    ],
                  ),
                ),
                Expanded(flex: 3, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
