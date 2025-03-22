import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../constatnts/app_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

class HomeController extends GetxController {
  void scrollToSkills(
      int index, List<GlobalKey> keysList, ScrollController scrollController) {
    if (index < 0 || index >= keysList.length) return;

    final key = keysList[index];
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final offsetY = renderBox.localToGlobal(Offset.zero).dy;
      scrollController.animateTo(
        offsetY,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  launchURL(String url) async {
    await launchUrl(Uri.parse(url.trim()));
  }

  launchWhatsAppUri() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+923174689617',
      text: "Hey! I'm Abdulmanan A Flutter Developer",
    );

    await launchUrl(link.asUri());
    if (kDebugMode) {
      print('..................${link.asUri()}');
    }
  }

  launchPhoneDialer(String phoneNumber) async {
    final url = "tel:$phoneNumber";

    await launchUrl(Uri.parse(url));
  }

  launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Hello', 'body': 'Hello, how are you?'});

    await launchUrl(Uri.parse(emailLaunchUri.toString()));
  }

  launchMap(String location) async {
    final url = "https://www.google.com/maps/search/?api=1&query=$location";

    await launchUrl(Uri.parse(url));
  }

  RxBool isLoading = false.obs;
  RxBool isDownoading = false.obs;

  Future<void> showDownloadDialog() async {
    isLoading.value = true;
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: scaffoldColor,
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: scaffoldColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Download CV',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Would you like to download my CV?',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your download CV logic here
                      // Once download is complete, set isLoading to false
                      downloadPdf().then((value) {});
                      Get.back();
                    },
                    child: const Text('Download'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      isLoading.value = false;
    });
  }

  Future<void> downloadPdf() async {
    try {
      isDownoading.value = true;
      final ByteData data = await rootBundle.load('assets/images/cv.pdf');
      final Uint8List bytes = data.buffer.asUint8List();

      if (kIsWeb) {
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        html.AnchorElement(href: url)
          ..setAttribute("download", "AbdulManan-flutter-dev.pdf")
          ..click();

        html.Url.revokeObjectUrl(url);
      } else {
        final directory = await getTemporaryDirectory();
        final path = "${directory.path}/assets/images/cv.pdf";
        final pdfFile = File(path);
        await pdfFile.writeAsBytes(bytes);

        debugPrint("....................PDF downloaded to: $path");
      }
      isDownoading.value = false;
    } catch (e) {
      isDownoading.value = false;

      debugPrint('Error downloading PDF: $e');
    }
  }
}
