import 'package:shared_preferences/shared_preferences.dart';

// Define Preference key here
enum SharePreferenceKey { isLogged }

typedef SPKey = SharePreferenceKey;

class SharePreferenceUtils {
  factory SharePreferenceUtils() {
    return instance;
  }

  SharePreferenceUtils._internal();

  static final SharePreferenceUtils instance = SharePreferenceUtils._internal();
  late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  String getString(SPKey key, {String defaultValue = ''}) =>
      _pref.getString(key.name) ?? defaultValue;

  Future<bool> setString(SPKey key, String? value) =>
      value != null ? _pref.setString(key.name, value) : _pref.remove(key.name);

  bool getBool(SPKey key) => _pref.getBool(key.name) ?? false;

  Future<bool> setBool(SPKey key, {bool value = false}) =>
      _pref.setBool(key.name, value);

  int getInt(SPKey key) => _pref.getInt(key.name) ?? 0;

  Future<bool> setInt(SPKey key, {int value = 0}) =>
      _pref.setInt(key.name, value);

  Future<void> clear() async {
    await _pref.clear();
  }
}

extension AppSharePreferences on SharePreferenceUtils {
  Future<bool> isLogged() async {
    return getBool(SPKey.isLogged);
  }
}
