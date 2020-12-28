import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_tv/presentation/Language/Language.en.dart';
import 'package:smart_tv/presentation/Utilities/AppRoutes.dart';
import 'package:smart_tv/presentation/Utilities/AppThemes.dart';

import 'data/repositories/local/data_sources/localDataSources.dart';

void main()  {
  //WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "${Language.smart_tv}",
      getPages: AppRoutes.AppRoutesList(),
      initialRoute: AppRoutes.INITIAL,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
    );
  }
}
