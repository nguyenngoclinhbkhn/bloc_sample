import 'package:flutter/src/widgets/navigator.dart';
import 'package:sample_bloc/presentation/screen/menu1/menu1_page.dart';
import 'package:sample_bloc/routes/base/factory_page_route.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';

class Menu1PageRoute extends FactoryPageRoute {
  @override
  SSPageRoute get pageRoute => SSPageRoute(page: Menu1Page());

  @override
  RouteSettings settings;

  Menu1PageRoute(this.settings);
}
