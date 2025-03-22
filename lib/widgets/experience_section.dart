import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constatnts/app_constants.dart';
import 'package:portfolio_website/constatnts/sized_box_extension.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 476,
        width: Get.width,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 3, child: Container()),
              const Text(
                'Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(flex: 6, child: Container()),
            ],
          ),
          10.h,
          experienceWidget(
              'Aylvah Software House ',
              "As a Flutter developer at Aylvah Software House, I've contributed to numerous projects, gaining valuable experience in collaborative teamwork. My role involved active participation in diverse projects, fostering an environment of shared learning and professional growth. ",
              'Flutter Developer',
              //'(Sep 2023 to Feb 2024)',
              '',
              '(Lahore)'),
          10.h,
          experienceWidget(
            'at Advisable Technology',
            "As a Intern Flutter Developer at Advisable Technology Software House, I've been involved in various projects, enriching my collaborative skills and professional development. My experience there was instrumental in broadening my knowledge and skills during my internship.",
            'Intern Flutter Developer',
            //  '(March 2023 to July 2023)',
            '',
            '(Lahore)',
          ),
        ]));
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
