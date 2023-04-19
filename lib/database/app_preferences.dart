import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_master.dart';
import '../utils/utility.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() => _instance;

  AppPreferences._internal();

  //------------------------- Preference Constants -----------------------------
  static const String keyLanguageCode = "keyLanguageCode";
  static const String keyLoginDetails = "keyLoginDetails";
  static const String keyName = "keyName";
  static const String keyEmail = "keyEmail";
  static const String keyPassword = "keyPassword";
  static const String keyRememberMe = "KeyRememberMe";
  static const String keyIsLoggedIn = "keyIsLoggedIn";
  static const String keyApiToken = "keyApiToken";

  // Method to get language code
  Future<String?> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyLanguageCode);
  }

  // Method to set language code
  Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyLanguageCode, value);
  }

  // Method to get login details
  Future<LoginDetails?> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginDetails = prefs.getString(keyLoginDetails);
    if (Utility.isEmpty(loginDetails)) {
      return null;
    }
    try {
      return LoginDetails.fromJson(json.decode(loginDetails!));
    } catch (e) {
      printf("App Preference error: ${e.toString()}");
    }
    return null;
  }

  // Method to set login details
  Future<bool> setLoginDetails(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyLoginDetails, value);
  }

  Future<void> saveApiToken({String? value}) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString(keyApiToken, value!);
  }

  Future<String> getApiToken() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(keyApiToken)!;
  }

  Future<String?> getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<bool?> getBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<bool> getIsLoggedIn() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getBool(keyIsLoggedIn)!;
  }

  Future<void> isLoggedIn({bool? value}) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool(keyIsLoggedIn, value!);
  }

  Future<void> clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(keyLoginDetails);
    // preferences.remove(keyEmail);
    // preferences.remove(keyPassword);
    // preferences.remove(keyRememberMe);
  }
}
