import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';

import 'config/environment.dart';
import 'main.dart';

void main() {
  Environment.configFlavor(FlavorValue.prod);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ja', 'JP')],
      fallbackLocale: const Locale('ja', 'JP'),
      path: 'resources/langs',
      assetLoader: JsonAssetLoader(),
      child: const MyApp(),
    ),
  );
}
