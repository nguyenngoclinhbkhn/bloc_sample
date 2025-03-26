import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sample_bloc/gen/assets.gen.dart';

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
      ..maskColor = Colors.black.withAlpha(100)
      ..maskType = EasyLoadingMaskType.custom
      ..dismissOnTap = false
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..boxShadow = []
      ..textColor = Colors.white;
  }

  static Widget _widgetLoadingCache() => Assets.images.loading2.image();

  static Widget _widgetLoadingNoCache() =>
      Assets.images.loading2.image(key: UniqueKey());
}
