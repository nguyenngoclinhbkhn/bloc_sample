import 'package:flutter/material.dart';
import 'package:sample_bloc/routes/base/ss_page_route.dart';

abstract class FactoryPageRoute<T> {
  RouteSettings get settings;

  SSPageRoute get pageRoute;
}
