import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/screen/login/login_argument.dart';
import 'package:sample_bloc/routes/app_route.dart';

import 'base/base_navigate.dart';

class AppNavigate extends Navigate {
  static final applicationKey = GlobalKey<NavigatorState>();
  static final AppNavigate instance = AppNavigate._internal();

  GlobalKey<NavigatorState> get key => applicationKey;

  factory AppNavigate() {
    return instance;
  }

  AppNavigate._internal();

  @override
  NavigatorState get navigateState => applicationKey.currentState!;

  Future<dynamic> gotoLogin(LoginArgument argument) async {
    return replaceAndClearBackStack(route: AppRoute.login, argument: argument);
  }

  Future<void> gotoApp() async {
    return replaceAndClearBackStack(route: AppRoute.appTab);
  }

  Future<void> gotoDetail() async {
    return add(route: AppRoute.detail);
  }
}

class NestedNavigate extends Navigate {
  /// For navigate inside nested navigator
  static final nestedKey = GlobalKey<NavigatorState>();
  static final NestedNavigate instance = NestedNavigate._internal();

  GlobalKey<NavigatorState> get key => nestedKey;

  factory NestedNavigate() {
    return instance;
  }

  NestedNavigate._internal();

  @override
  NavigatorState get navigateState => nestedKey.currentState!;

  Future<void> gotoMenu1() async {
    return replace(route: AppRoute.menu1);
  }

  Future<void> gotoMenu2() async {
    return replace(route: AppRoute.menu2);
  }
}
