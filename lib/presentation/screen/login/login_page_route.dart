import 'package:flutter/src/widgets/navigator.dart';
import 'package:sample_bloc/presentation/screen/login/login_argument.dart';
import 'package:sample_bloc/routes/base/factory_page_route.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';
import 'package:sample_bloc/routes/base/transition.dart';

import 'login_page.dart';

class LoginPageRoute extends FactoryPageRoute {
  @override
  SSPageRoute get pageRoute {
    final argument = settings.arguments as LoginArgument?;
    return SSPageRoute(
      page: LoginPage(argument: argument),
      transitionType: TransitionType.bottomToTop,
      duration: TransitionType.bottomToTop.duration,
    );
  }

  @override
  RouteSettings settings;

  LoginPageRoute(this.settings);
}
