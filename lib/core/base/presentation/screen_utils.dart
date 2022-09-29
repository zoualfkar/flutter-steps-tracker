
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

mixin ScreenUtils<T extends StatefulWidget> on State<T> {


  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      {
      String? customMessage,
      bool isFloating = false}) {
    String message = customMessage ?? 'error_message'.tr();

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).errorColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      {String? customMessage, bool isFloating = false}) {
    String message = customMessage ?? 'success'.tr();
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }
}
