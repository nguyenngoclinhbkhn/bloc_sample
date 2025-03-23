import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:sample_bloc/utils/extension_list.dart';

enum FlavorValue { dev, stg, prod }

extension FlavorValueEx on FlavorValue {
  bool get supportCharles {
    switch (this) {
      case FlavorValue.dev:
      case FlavorValue.stg:
        return true;
      case FlavorValue.prod:
        return false;
    }
  }
}

extension Environment on FlavorValue {
  static FlavorValue of(String? env) =>
      FlavorValue.values.firstWhereOrNull((flavor) => flavor.name == env) ??
      FlavorValue.dev;

  static const _baseUrl = 'BASE_URL';

  String get _name {
    switch (this) {
      case FlavorValue.dev:
        return 'dev';
      case FlavorValue.stg:
        return 'stg';
      case FlavorValue.prod:
        return 'prod';
    }
  }

  Map<String, String> get _variables {
    switch (this) {
      case FlavorValue.dev:
        return {_baseUrl: 'https:dev'};
      case FlavorValue.stg:
        return {_baseUrl: 'https:stg'};
      case FlavorValue.prod:
        return {_baseUrl: 'https:prod'};
    }
  }

  static FlavorValue get flavor => of(FlavorConfig.instance.name);

  static void configFlavor(FlavorValue value) {
    FlavorConfig(name: value._name, variables: value._variables);
  }

  static String get baseUrl => FlavorConfig.instance.variables[_baseUrl] ?? '';

  static String get iOSAppId => '';
}
