import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/views/home/controller/home_controller.dart';
import 'package:portfolio_website/widgets/about_me_section.dart';
import 'package:portfolio_website/widgets/contact_section.dart';
import 'package:portfolio_website/widgets/desktop_about_me_section.dart';
import 'package:portfolio_website/widgets/experience_section.dart';

import '../../constatnts/app_constants.dart';
import '../../widgets/desktop_header.dart';
import '../../widgets/main_desktop.dart';
import '../../widgets/main_mobile.dart';
import '../../widgets/mobile_drawer.dart';
import '../../widgets/skill_section.dart';
import '../../widgets/skill_section_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();

  List<GlobalKey> keysList = List.generate(5, (index) => GlobalKey());

  final HomeController homeController = Get.find<HomeController>();
  bool shouldAnimate = true;

  @override
  void initState() {
    super.initState();
    // scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    //  scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: scaffoldColor,
        endDrawer: constraints.maxWidth >= maxWidthDesktop
            ? null
            : DrawerMobile(
                onNavItemTap: (int index) {
                  homeController.scrollToSkills(
                      index, keysList, scrollController);
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                key: keysList[0],
              ),
              if (constraints.maxWidth >= maxWidthDesktop)
                DesktopHeader(
                  onTap: (int index) {
                    homeController.scrollToSkills(
                        index, keysList, scrollController);
                  },
                )
              else
                drawerDesign(),
              if (constraints.maxWidth >= maxWidthDesktop)
                const MainDesktop()
              else
                MainMobile(),
              Column(
                children: [
                  if (constraints.maxWidth >= maxWidthDesktop)
                    SkllsSectionDesktop(
                      key: keysList[1],
                      shouldAnimate: shouldAnimate, // Pass animation state
                    )
                  else
                    SkllsSectionMobile(
                      key: keysList[1],
                      onTap: () {
                        homeController.scrollToSkills(
                            1, keysList, scrollController);
                      },
                    ),
                ],
              ),
              DesktopAboutMeSection(
                key: keysList[2],
              ),
              if (constraints.maxWidth >= maxWidthDesktop)
                ExperienceSection(
                  key: keysList[3],
                )
              else
                AboutMeSection(
                  key: keysList[3],
                ),
              ContactSection(
                key: keysList[4],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget drawerDesign() {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          color: bgLight1,
          gradient:
              const LinearGradient(colors: [Colors.transparent, bgLight1]),
          borderRadius: BorderRadius.circular(10)),
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
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
