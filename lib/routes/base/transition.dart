import 'package:flutter/cupertino.dart';

enum TransitionType { none, leftToRight, rightToLeft, bottomToTop, topToBottom }

extension TransitionEx on TransitionType {
  Duration get duration {
    switch (this) {
      case TransitionType.leftToRight:
      case TransitionType.rightToLeft:
      case TransitionType.bottomToTop:
      case TransitionType.topToBottom:
        return Duration(milliseconds: 1000);
      case TransitionType.none:
        return Duration.zero;
    }
  }

  static SlideTransition leftToRight(
    Animation<double> animation,
    Widget? child,
  ) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }

  static SlideTransition rightToLeft(
    Animation<double> animation,
    Widget? child,
  ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }

  static SlideTransition topToBottom(
    Animation<double> animation,
    Widget? child,
  ) {
    var begin = Offset(0.0, -1.0);
    var end = Offset.zero;

    final tween = Tween<Offset>(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: Curves.easeInOut));

    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  static SlideTransition bottomToTop(
    Animation<double> animation,
    Widget? child,
  ) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;

    final tween = Tween<Offset>(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: Curves.easeInOut));

    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }
}
