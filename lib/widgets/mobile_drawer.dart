import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/views/home/controller/home_controller.dart';

import '../constatnts/app_constants.dart';

class DrawerMobile extends StatelessWidget {
  DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final HomeController homeController = Get.find<HomeController>();
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: 200,
      child: Drawer(
        backgroundColor: scaffoldColor,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            for (int i = 0; i < navIcons.length; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                titleTextStyle: const TextStyle(
                  color: whiteSecandory,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                onTap: () {
                  onNavItemTap(i);
                  Navigator.of(context).pop();
                },
                leading: Icon(navIcons[i]),
                title: Text(buttonList[i]),
              ),

            //child: Lottie.asset('assets/images/download.json')),
            // Obx(
            //   () => homeController.isDownoading.value
            //       ?const Text('data')
            //       : SizedBox.fromSize(),
            // ),
            Obx(() => GestureDetector(
                  onTap: () {
                    homeController.showDownloadDialog();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: AnimatedContainer(
                      duration: Duration(
                          seconds: homeController.isLoading.value ? 0 : 2),
                      height: 50,
                      width: 120,
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
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Icon(Icons.save_alt),
                            Spacer(),
                            Text(
                              'Download CV',
                              style: TextStyle(
                                fontSize: 20,
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
      ),
    );
  }
}
