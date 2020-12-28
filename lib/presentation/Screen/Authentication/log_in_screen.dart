import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_tv/presentation/Language/Language.en.dart';
import 'package:smart_tv/presentation/Utilities/AppAssets.dart';
import 'package:smart_tv/presentation/Widgets/DefaultTextField.dart';

class LogInScreen extends StatelessWidget {

  var _email_controller = TextEditingController();
  var _password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_background_image(), _body(context)],
      ),
    );
  }

  Container _body(context) {
    return Container(
      width: Get.width,
      height: Get.height,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          _welcome_text(context),
          Spacer(),
          _signInTextFileds(),

        ],
      ),
    );
  }

  Container _background_image() {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppAssets.login_background,
              ))),
    );
  }

  _welcome_text(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Language.welcome_back}",
          style: Theme
              .of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
        Text("${Language.sign_in_to_continue}",
            style: Theme
                .of(context)
                .textTheme
                .bodyText1
                .copyWith(
              color: Colors.white,
            )),
      ],
    );
  }

  _signInTextFileds() {
    return Column(
      children: [

     //   DefaultTextField(controller:_email_controller , hint: Language.email),
      //  DefaultTextField(controller:_password_controller , hint: Language.password),

      ],
    );
  }
}
