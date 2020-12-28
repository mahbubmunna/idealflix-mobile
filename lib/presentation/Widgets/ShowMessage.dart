import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smart_tv/presentation/Language/Language.en.dart';
import 'package:smart_tv/presentation/Widgets/FlushBar/flushbar_helper.dart';

import 'FlushBar/flushbar.dart';

void SuccessMessage(BuildContext context, {String message = ''}) {
  FlushbarHelper.createSuccess(message: message, position: FlushbarPosition.TOP)
    ..show(context);
}

void ErrorMessage(BuildContext context, {var message = ''}) {
  FlushbarHelper.createError(
      message: message.runtimeType == String
          ? message
          : Language.Something_went_wrong,
      position: FlushbarPosition.TOP)
    ..show(context);
}

void ShowMessage(BuildContext context, {String message}) {
  Flushbar(
    message: message,
    backgroundColor: Colors.black,
    icon: Icon(
      Icons.info_outline,
      color: Colors.white,
    ),
    duration: Duration(milliseconds: 1500),
    leftBarIndicatorColor: Colors.blue[300],
    borderRadius: 5,
  )..show(context);
}
