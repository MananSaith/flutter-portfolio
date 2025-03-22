import 'package:flutter/material.dart';
import 'package:portfolio_website/constatnts/sized_box_extension.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

import '../constatnts/app_constants.dart';

// ignore: must_be_immutable
class SkllsSectionMobile extends StatelessWidget {
  final Function()? onTap;
  const SkllsSectionMobile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(color: bgLight1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.h,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CustomButton(text: 'Expertise')],
              ),
              20.h,
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      expertiseAnimations(0.90, 'Flutter'),
                      10.w,
                      expertiseAnimations(0.80, 'Firebase'),
                      10.w,
                      expertiseAnimations(0.80, 'API\nIntegration'),
                      10.w,
                      expertiseAnimations(0.90, 'Teachable\nMachine'),
                      10.w,
                      expertiseAnimations(0.45, 'Node js'),
                    ],
                  ),
                ),
              ),
              70.h,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CustomButton(text: 'Skills')],
              ),
              17.h,
              SizedBox(
                height: 610,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: skillsList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 80,
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: valueList[index]),
                          duration: const Duration(seconds: 3),
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: SizedBox(
                                // height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, left: 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            skillsList[index],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          Text('${(value * 100).toInt()}%')
                                        ],
                                      ),
                                    ),
                                    LinearProgressIndicator(
                                      value: value,

                                      backgroundColor: Colors.white,
                                      valueColor: const AlwaysStoppedAnimation(
                                          Color(0xff062593)),
                                      // borderRadius: BorderRadiusGeometry(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget expertiseAnimations(double value, String text) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: value),
        duration: const Duration(seconds: 5),
        builder: (context, value, child) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          value: value,
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation(
                            Color(0xff062593),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 43,
                          left: 36,
                          child: Text(
                            '${(value * 100).toInt()}%',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      
                    ],
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          );
        });
  }
}
