import 'package:flutter/src/widgets/navigator.dart';
import 'package:sample_bloc/presentation/screen/detail/detail_page.dart';
import 'package:sample_bloc/routes/base/factory_page_route.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';
import 'package:sample_bloc/routes/base/transition.dart';

class DetailPageRoute extends FactoryPageRoute {
  @override
  SSPageRoute get pageRoute => SSPageRoute(
    page: DetailPage(),
    transitionType: TransitionType.rightToLeft,
    duration: TransitionType.rightToLeft.duration,
  );

  @override
  RouteSettings settings;

  DetailPageRoute(this.settings);
}
