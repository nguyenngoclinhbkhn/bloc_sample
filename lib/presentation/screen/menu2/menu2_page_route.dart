import 'package:flutter/src/widgets/navigator.dart';
import 'package:sample_bloc/presentation/screen/menu2/menu2_page.dart';
import 'package:sample_bloc/routes/base/factory_page_route.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';

class Menu2PageRoute extends FactoryPageRoute {
  @override
  SSPageRoute get pageRoute => SSPageRoute(page: Menu2Page());

  @override
  RouteSettings settings;

  Menu2PageRoute(this.settings);
}
