import 'package:get/get.dart';
import 'package:smart_tv/core/error/AppError.dart';
import 'package:smart_tv/data/repositories/UserRepository.dart';
import 'package:smart_tv/data/repositories/local/data_sources/localDataSources.dart';
import 'package:smart_tv/presentation/Language/Language.en.dart';
import 'package:smart_tv/presentation/Utilities/AppHelper.dart';
import 'package:smart_tv/presentation/Widgets/FlushBar/flushbar_helper.dart';
import 'package:smart_tv/presentation/Widgets/ShowMessage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
    getToken();
    isSubscribe();
  }

  void getToken() async {
    await UserRepositoryImpl().getToken().then((value) {
      // print("Is Right  ${value.isRight()}");

      value.fold((AppError appError) {
        //Get.snackbar(Language.Something_went_wrong, appError.errorMessage);
      }, (token) {
        AppHelper.token = token;
        FlushbarHelper.createSuccess(
            message: value.foldRight("The Token ${token}", (previous, r) => r));
      });
    });
  }

  void isSubscribe() async {
    await UserRepositoryImpl().isMember().then((value) {
      value.fold((l) {
        print(l.errorMessage);
      }, (r) {
        print(r);
        AppHelper.isSubscription = r;
      });
    });
  }
}
