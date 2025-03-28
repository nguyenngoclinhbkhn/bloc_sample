import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample_bloc/data/local/sharepreference/share_preferences_utils.dart';
import 'package:sample_bloc/data/local/sqlite/sqflite_utils.dart';
import 'package:sample_bloc/data/network/base/provider.dart';
import 'package:sample_bloc/routes/app_navigate.dart';
import 'package:sample_bloc/routes/app_route.dart';
import 'package:sample_bloc/widget/loading/loading.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigate.instance.key,
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: true,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      initialRoute: AppRoute.splash.rawValue,
      onGenerateRoute: AppRoute.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
        highlightColor: Colors.white,
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(primary: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
          thickness: 1,
          space: 1,
        ),
        appBarTheme: const AppBarTheme(color: Colors.white),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}

Future<void> initService() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SharePreferenceUtils().init();
  await SqfliteUtils().init();
  await ApiProvider().configCharles();
  Loading.configLoading();
}
