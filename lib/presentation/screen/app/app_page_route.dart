import 'package:flutter/src/widgets/navigator.dart';
import 'package:sample_bloc/routes/base/factory_page_route.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';
import 'package:sample_bloc/routes/base/transition.dart';

import 'app_page.dart';

class AppPageRoute extends FactoryPageRoute {
  @override
  SSPageRoute get pageRoute {
    return SSPageRoute(
      page: AppPage(),
      transitionType: TransitionType.none,
      duration: TransitionType.none.duration,
    );
  }

  @override
  RouteSettings settings;

  AppPageRoute(this.settings);
}
