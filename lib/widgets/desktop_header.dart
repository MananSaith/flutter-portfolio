import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constatnts/app_constants.dart';
import '../views/home/controller/home_controller.dart';

class DesktopHeader extends StatelessWidget {
  final Function(int) onTap;
  // ignore: use_super_parameters
  DesktopHeader({Key? key, required this.onTap}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: bgLight1,
        gradient: const LinearGradient(colors: [
          Colors.transparent,
          bgLight1,
        ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Abdul',
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5),
                ),
                TextSpan(
                  text: 'Manan',
                  style: TextStyle(
                      decorationThickness: 1.5,
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          const Spacer(),
          for (int i = 0; i < buttonList.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () {
                  onTap(i);
                },
                child: Text(
                  buttonList[i],
                  style: const TextStyle(
                      color: whiteSecandory,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          Obx(() => GestureDetector(
                onTap: () {
                  homeController.showDownloadDialog();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: AnimatedContainer(
                    duration: Duration(
                        seconds: homeController.isLoading.value ? 0 : 2),
                    height: 40,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 7, 4, 77),
                        Color.fromARGB(255, 4, 77, 234)
                      ]),
                      boxShadow: homeController.isLoading.value
                          ? []
                          : [
                              const BoxShadow(
                                offset: Offset(10, 10),
                                // color: Colors.white,
                              )
                            ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.save_alt,
                            size: 20,
                          ),
                          Spacer(),
                          Text(
                            'Download CV',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
