import 'package:get/get.dart';
import 'package:portfolio_website/views/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // TODO: implement dependencies
  }
}
