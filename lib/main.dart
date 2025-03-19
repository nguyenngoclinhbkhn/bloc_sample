import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sample_bloc/routes/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.light,
      initialRoute: AppRoute.splash.rawValue,
      onGenerateRoute: AppRoute.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorName.bgMain,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: ColorName.main,
        colorScheme: const ColorScheme.light(primary: ColorName.textBlack09),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dividerTheme: const DividerThemeData(
          color: ColorName.line,
          thickness: 1,
          space: 1,
        ),
        appBarTheme: const AppBarTheme(color: ColorName.monoWht),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
