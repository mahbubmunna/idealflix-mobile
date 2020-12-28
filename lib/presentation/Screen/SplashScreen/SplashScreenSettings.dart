import 'package:get/get.dart';
import 'package:smart_tv/data/models/UserModel.dart';
import 'package:smart_tv/data/repositories/UserRepository.dart';
import 'package:smart_tv/data/repositories/local/Reposatoris/UserRepositoryLocal.dart';
import 'package:smart_tv/data/repositories/local/data_sources/localDataSources.dart';
import 'package:smart_tv/presentation/Screen/SplashScreen/SplashScreenController.dart';
import 'package:smart_tv/presentation/Utilities/AppRoutes.dart';

class SplashScreenSetting {
  void settings() async {
    await LocalDatabase.instance.initiate();
    await Get.put(SplashScreenController());
    await Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
  }
}
