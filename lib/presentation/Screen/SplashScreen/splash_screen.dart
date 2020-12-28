import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_tv/data/repositories/local/data_sources/localDataSources.dart';
import 'package:smart_tv/presentation/Screen/SplashScreen/SplashScreenController.dart';
import 'package:smart_tv/presentation/Screen/SplashScreen/SplashScreenSettings.dart';
import 'package:smart_tv/presentation/Utilities/AppAssets.dart';
import 'package:smart_tv/presentation/Utilities/AppColors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // _splashScreenController = Get.put(SplashScreenController());

    SplashScreenSetting().settings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image(
          height: 150,
          width: 150,
          image: AssetImage(
            AppAssets.logo,
          ),
        ),
      ),
    );
  }
}
