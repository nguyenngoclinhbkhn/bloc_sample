import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/screen/app/app_page_route.dart';
import 'package:sample_bloc/presentation/screen/detail/detail_page_route.dart';
import 'package:sample_bloc/presentation/screen/login/login_page_route.dart';
import 'package:sample_bloc/presentation/screen/menu1/menu1_page_route.dart';
import 'package:sample_bloc/presentation/screen/menu2/menu2_page_route.dart';
import 'package:sample_bloc/presentation/screen/splash/splash_page.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';
import 'package:sample_bloc/utils/extension_list.dart';

enum AppRoute {
  splash('/splash'),
  login('/login'),
  appTab('/appTab'),
  menu1('/menu1'),
  menu2('/menu2'),
  detail('detail');

  const AppRoute(this.rawValue);

  final String rawValue;

  static AppRoute? getScreenNameByString(String routing) => AppRoute.values
      .firstWhereOrNull((activity) => activity.rawValue == routing);

  static Route? onGenerateRoute(RouteSettings settings) {
    final name = AppRoute.getScreenNameByString(settings.name ?? '');
    debugPrint("--- name $name");
    if (name == null) {
      return null;
    }
    switch (name) {
      case AppRoute.splash:
        return SSPageRoute(page: SplashPage());
      case AppRoute.login:
        return LoginPageRoute(settings).pageRoute;
      case AppRoute.appTab:
        return AppPageRoute(settings).pageRoute;
      case AppRoute.menu1:
        return Menu1PageRoute(settings).pageRoute;
      case AppRoute.menu2:
        return Menu2PageRoute(settings).pageRoute;
      case AppRoute.detail:
        return DetailPageRoute(settings).pageRoute;
    }
  }
}
