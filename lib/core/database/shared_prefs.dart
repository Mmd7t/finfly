import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static void save<T>(String key, T data) async {
    if (data is int) {
      await _prefs!.setInt(key, data as int);
    } else if (data is String) {
      log('data ::: $data');
      await _prefs!.setString(key, data as String);
    } else if (data is bool) {
      await _prefs!.setBool(key, data as bool);
    } else if (data is double) {
      await _prefs!.setDouble(key, data as double);
    }
  }

  static int getInt(String key) {
    int data = _prefs!.getInt(key) ?? 0;
    return data;
  }

  static double getDouble(String key) {
    double data = _prefs!.getDouble(key) ?? 0.0;
    return data;
  }

  static String getString(String key) {
    String data = _prefs!.getString(key) ?? '';
    return data;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    bool data = _prefs!.getBool(key) ?? defaultValue;
    return data;
  }
}
