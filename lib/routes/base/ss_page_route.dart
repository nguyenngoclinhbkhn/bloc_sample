import 'package:flutter/material.dart';
import 'package:sample_bloc/routes/base/transition.dart';

Widget _defaultTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return child;
}

class SSPageRoute<T> extends PageRoute<T> {
  SSPageRoute({
    super.settings,
    super.requestFocus,
    required this.page,
    this.transitionType = TransitionType.none,
    this.duration = Duration.zero,
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
  }) {
    pageBuilder = (_, _, _) => page;
    transitionsBuilder = (context, animation, secondaryAnimation, child) {
      final isOut = secondaryAnimation.status == AnimationStatus.reverse;
      switch (transitionType) {
        case TransitionType.leftToRight:
          return isOut
              ? TransitionEx.rightToLeft(animation, child)
              : TransitionEx.leftToRight(animation, child);
        case TransitionType.rightToLeft:
          return isOut
              ? TransitionEx.leftToRight(animation, child)
              : TransitionEx.rightToLeft(animation, child);
        case TransitionType.bottomToTop:
          return isOut
              ? TransitionEx.topToBottom(animation, child)
              : TransitionEx.bottomToTop(animation, child);
        case TransitionType.topToBottom:
          return isOut
              ? TransitionEx.bottomToTop(animation, child)
              : TransitionEx.topToBottom(animation, child);
        case TransitionType.none:
          return _defaultTransitionsBuilder(
            context,
            animation,
            secondaryAnimation,
            child,
          );
      }
    };
  }

  final Widget page;
  late RoutePageBuilder pageBuilder;

  final TransitionType transitionType;
  late RouteTransitionsBuilder transitionsBuilder;

  final Duration duration;

  @override
  Duration get transitionDuration => duration;

  @override
  Duration get reverseTransitionDuration => duration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return transitionsBuilder(context, animation, secondaryAnimation, child);
  }
}
