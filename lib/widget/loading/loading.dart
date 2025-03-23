import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  static Future<void> show() async {
    await EasyLoading.show(maskType: EasyLoadingMaskType.custom);
  }

  static Future<void> dismiss() async {
    await EasyLoading.dismiss();
  }

  static bool get isShow => EasyLoading.isShow;

  static void configLoading() async {
    EasyLoading.instance
      ..indicatorWidget = _widgetLoadingCache()
      ..indicatorColor = Colors.red
      ..maskColor = Colors.black.withAlpha(10)
      ..maskType = EasyLoadingMaskType.custom
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..boxShadow = []
      ..textColor = Colors.white;
  }

  static Widget _widgetLoadingCache() =>
      Image.asset('assets/images/loading_2.gif');

  static Widget _widgetLoadingNoCache() =>
      Image.asset(key: UniqueKey(), 'assets/images/loading_2.gif');
}
