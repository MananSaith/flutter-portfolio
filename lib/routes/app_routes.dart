import 'package:get/get.dart';
import 'package:portfolio_website/views/home/binding/home_binding.dart';
import 'package:portfolio_website/views/home/home_screen.dart';
import 'package:portfolio_website/views/splash/binding/splash_binding.dart';
import 'package:portfolio_website/views/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash_screen';
  static const String home = '/home_screen';
  static getPages() => [
        GetPage(
          name: splash,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
          GetPage(
          name: home,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ];
}
