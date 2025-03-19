import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/screen/splash/splash.dart';
import 'package:sample_bloc/utils/extension_list.dart';

abstract class AAppRoute<T> {
  Route createRoute(RouteSettings settings) {
    throw UnimplementedError();
  }
}

enum AppRoute {
  splash('/splash'),
  login('/login'),
  appTab('/appTab'),
  menu1('/home'),
  menu2('/storeSelection'),
  menu3('/errorDialog');

  const AppRoute(this.rawValue);

  final String rawValue;

  static AppRoute? getScreenNameByString(String routing) => AppRoute.values
      .firstWhereOrNull((activity) => activity.rawValue == routing);

  static Route? onGenerateRoute(RouteSettings settings) {
    final name = AppRoute.getScreenNameByString(settings.name ?? '');
    if (name == null) {
      return null;
    }
    switch (name) {
      case AppRoute.splash:
        return PageRouteBuilder(pageBuilder: (_, _, _) =>  Splash());
      case AppRoute.login:
        return LoginRoute().createRoute(settings);
      case AppRoute.appTab:
        return AppTabRoute().createRoute(settings);
      case AppRoute.home:
        return ChainStoreRoute().createRoute(settings);
      case AppRoute.storeSelection:
        return StoreSelectionRoute().createRoute(settings);
      case AppRoute.blank:
        return MBBlankRoute().createRoute(settings);
      case AppRoute.setting:
        return SettingRoute().createRoute(settings);
      case AppRoute.errorDialog:
        // it's a dialog, not screen
        return null;
      case AppRoute.storeSummary:
        return StoreSummaryRoute().createRoute(settings);
      case AppRoute.storeSummaryPicker:
        return null;
      case AppRoute.enterNotes:
        return EnterNotesRoute().createRoute(settings);
      case AppRoute.licence:
        return LicenceRoute().createRoute(settings);
      case AppRoute.licenceDetail:
        return LicenceDetailRoute().createRoute(settings);
      case AppRoute.c01webview:
        return C01WebviewRoute().createRoute(settings);
      case AppRoute.b032Entered:
        return B032Route().createRoute(settings);
    }
  }

  static Duration getDuration(Transition transition) {
    if (transition == Transition.noTransition) {
      return const Duration(milliseconds: 0);
    } else {
      return const Duration(milliseconds: 300);
    }
  }

  static String get currentRouteName =>
      Get.routing.route?.settings.name ?? Get.routing.current;

  static bool get isDialogNotShowing =>
      AppRoute.getScreenNameByString(currentRouteName) != AppRoute.errorDialog;
}
