import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/screen/dialog/dialog.dart';
import 'package:sample_bloc/routes/app_route.dart';

abstract class Navigate {
  GlobalKey<NavigatorState> get key;

  NavigatorState get navigateState => key.currentState!;

  bool get canPop => navigateState.canPop();

  Future<T?> add<T>({required AppRoute route, dynamic argument}) async {
    return navigateState.pushNamed<T>(route.rawValue, arguments: argument);
  }

  Future<T?> replace<T>({required AppRoute route, dynamic argument}) async {
    return navigateState.pushReplacementNamed(
      route.rawValue,
      arguments: argument,
    );
  }

  Future<T?> replaceAndClearBackStack<T>({
    required AppRoute route,
    dynamic argument,
  }) async {
    return navigateState.pushNamedAndRemoveUntil(
      route.rawValue,
      (Route<dynamic> route) => false,
      arguments: argument,
    );
  }

  void back<T>({T? result}) {
    final canPop = navigateState.canPop() ?? false;
    debugPrint("----- canPop ? $canPop");
    if (true) {
      return navigateState.pop(result);
    } else {
      debugPrint('----- System navigatior pop');
      exit(0);
    }
  }

  void backToRoute({required AppRoute route}) {
    return navigateState.popUntil(ModalRoute.withName(route.rawValue));
  }

  void showAppDialog({
    String title = '',
    String message = '',
    String positiveText = '',
    String negativeText = '',
    Function()? onPositiveClicked,
    Function()? onNegativeClicked,
  }) {
    showDialog(
      context: navigateState.context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          message: message,
          positive: positiveText,
          negative: negativeText,
          onNegative: onNegativeClicked,
          onPositive: onPositiveClicked,
        );
      },
    );
  }
}
