//ignore: unused_import
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }


  Future<void> genderSelected(String value) {
    return _sharedPreferences!.setString('genderSelected', value);
  }

  String getGenderSelected() {
    return _sharedPreferences!.getString('genderSelected').toString();
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }


  Future<void> setUserSession(String value) {
    return _sharedPreferences!.setBool('isLoggedIn', true);
  }

  bool getUserSession() {
    try {
      return _sharedPreferences!.getBool('isLoggedIn')!;
    } catch (e) {
      return false;
    }
  }

  Future<void> setUserToken(String value) {
    return _sharedPreferences!.setString('userToken', value);
  }

  String getUserToken() {
    try {
      return _sharedPreferences!.getString('userToken')!;
    } catch (e) {
      return '';
    }
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
