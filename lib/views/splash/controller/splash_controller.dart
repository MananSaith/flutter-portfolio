import 'package:get/get.dart';
import 'package:portfolio_website/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4), () {
      Get.toNamed(AppRoutes.home);
    });
  }
}
