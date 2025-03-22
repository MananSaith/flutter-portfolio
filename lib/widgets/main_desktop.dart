import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constatnts/sized_box_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../constatnts/app_constants.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.only(left: 20
          // horizontal: 20.0,
          ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // intro message
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    "Hi,\nI'm AbdulManan \nA Flutter Developer",
                    textStyle: const TextStyle(fontSize: 20),
                    speed: const Duration(seconds: 01),
                    colors: [
                      white,
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
              15.h,
              // contact btn
              SizedBox(
                  width: 250.0,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [appPrimaryColor, appPrimaryColor2]),
                        boxShadow: const [BoxShadow(offset: Offset(10, 10))]),
                    child: Center(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Get in touch',
                            textStyle: const TextStyle(fontSize: 20),
                            speed: const Duration(milliseconds: 400),
                          ),
                          TypewriterAnimatedText(
                            'Get in touch',
                            textStyle: const TextStyle(fontSize: 20),
                            speed: const Duration(milliseconds: 400),
                          ),
                        ],
                        onTap: () {},
                      ),
                    ),
                  )),
              20.h,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL(
                          'https://www.linkedin.com/in/abdul-manan-8a9202240/');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/l.png')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://github.com/MananSaith');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/g.png')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchWhatsAppUri();
                    },
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/w.png')),
                  ),
                ],
              )
            ],
          ),
          // avatar img
          //    const Spacer(),
          20.w,
          Expanded(
            child: Image.asset(
              "assets/images/desktop_profile.png",
              height: screenHeight / 1.2,
              width: screenWidth / 1.5,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw '...........Could not launch $url';
    }
  }

  launchWhatsAppUri() async {
    // ignore: prefer_const_constructors
    final link = WhatsAppUnilink(
      phoneNumber: '+923174689617',
      text: "Hey! I'm AbdulManan A Flutter Developer",
    );

    await launchUrl(link.asUri());
  }
}
