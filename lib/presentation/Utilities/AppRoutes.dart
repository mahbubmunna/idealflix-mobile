import 'package:get/get.dart';
import 'package:smart_tv/presentation/Screen/Authentication/log_in_screen.dart';
import 'package:smart_tv/presentation/Screen/SplashScreen/splash_screen.dart';

class AppRoutes {
  static String INITIAL = "/";
  static String LOGIN_SCREEN = "log_in_screen/";

  static List<GetPage> AppRoutesList() {
    return [
      GetPage(name: INITIAL, page: () => SplashScreen()),
      GetPage(name: LOGIN_SCREEN, page: () => LogInScreen()),
    ];
  }
}
