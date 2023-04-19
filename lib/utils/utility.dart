import 'dart:developer' as dev;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../style/dimensions.dart';
import 'app_constants.dart';

void printf(dynamic value) {
  if (!kReleaseMode) dev.log(value.toString());
}

class Utility {
  static bool isShowing = false;

  static bool isEmpty(String? string) {
    return string == null || string.length == 0;
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Widget? hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return null;
  }

  static Future<String> getUserAPIKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAPIKey = prefs.getString(AppConstants.apiKey);
    return userAPIKey!;
  }

  static snackBar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget buildProgressIndicator() {
    return Container(
      height: Dimensions.screenHeight,
      color: black.withOpacity(0.4),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: blue,
          valueColor: new AlwaysStoppedAnimation<Color>(white),
        ),
      ),
    );
  }
  void showProgressBarDialog() async {
    isShowing = true;
    Get.dialog(
        barrierDismissible: false,
        useSafeArea: true,
        Dialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 100.0,
              width: 100.0,
              child: WillPopScope(
                onWillPop: () => Future.value(false),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            primary81),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }

  void hideProgressBarDialog() async {
    if (isShowing) {
      Get.back();
      isShowing = false;
    }
  }

   void showProgressDialog(BuildContext context, {from}) {
    isShowing = true;
    showDialog(
        barrierDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }

   void hideProgressDialog(BuildContext context) {
    if (isShowing) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      isShowing = false;
    }
  }

  String getFormattedDate(DateTime dateTime) {
    String currentDate = DateFormat('E, dd MMM yyyy').format(dateTime);
    return currentDate;
  }

  String getWeekDay(DateTime dateTime) {
    String currentDate = DateFormat('EEEE').format(dateTime);
    return currentDate;
  }
}
