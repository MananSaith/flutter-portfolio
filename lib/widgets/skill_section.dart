import 'package:flutter/material.dart';
import 'package:portfolio_website/constatnts/sized_box_extension.dart';
import 'package:portfolio_website/widgets/custom_button.dart';

import '../constatnts/app_constants.dart';

class SkllsSectionDesktop extends StatelessWidget {
  final bool shouldAnimate;

  // ignore: use_super_parameters
  const SkllsSectionDesktop({Key? key, required this.shouldAnimate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                expertiseAnimations(0.80, 'Flutter'),
                expertiseAnimations(0.95, 'Firebase'),
                expertiseAnimations(0.92, 'API\nIntegration'),
                expertiseAnimations(0.90, 'Teachable\nMachine'),
                expertiseAnimations(0.45, 'Node js'),
              ],
            ),
            70.h,
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CustomButton(text: 'Skills')],
                ),
                17.h,
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: skillsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 60,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 1),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          child: Visibility(
                            visible:
                                shouldAnimate, // Set visibility based on shouldAnimate
                            child: TweenAnimationBuilder(
                              tween: Tween<double>(
                                  begin: 0, end: valueList[index]),
                              duration: const Duration(seconds: 3),
                              builder: (context, value, child) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: SizedBox(
                                    height: 300,
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
                                                    fontSize: 16),
                                              ),
                                              const Spacer(),
                                              Text('${(value * 100).toInt()}%')
                                            ],
                                          ),
                                        ),
                                        LinearProgressIndicator(
                                          value: value,
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              const AlwaysStoppedAnimation(
                                                  Color(0xff062593)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget expertiseAnimations(double value, String text) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: value),
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: CircularProgressIndicator(
                    value: value,
                    backgroundColor: Colors.white,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff062593)),
                  ),
                ),
              ),
              Positioned(
                  top: 55,
                  left: 40,
                  child: Text(
                    '${(value * 100).toInt()}%',
                    style: const TextStyle(fontSize: 20),
                  )),
              
              Positioned(
                bottom: -59,
                left: 20,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
