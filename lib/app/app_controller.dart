import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/base_controller.dart';
import '../database/app_preferences.dart';
import '../services/index.dart';
import '../utils/app_constants.dart';
import '../utils/utility.dart';

class AppController extends BaseController {
  var locale = AppConstants.languageEnglish;
  AppPreferences appPreferences = AppPreferences();

  void changeLanguage() async {
    String? locale = await appPreferences.getLanguageCode();
    if (Utility.isEmpty(locale!)) {
      await appPreferences.setLanguageCode(this.locale);
      locale = this.locale;
    }
    this.locale = locale;
    Get.updateLocale(Locale(this.locale));
  }

  @override
  void onInit() {
    super.onInit();
    Services().setAppConfig();
  }
}
