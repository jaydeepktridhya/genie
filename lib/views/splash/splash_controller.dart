import 'dart:async';

import 'package:genie/model/login_master.dart';
import 'package:genie/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_controller.dart';
import '../../controller/base_controller.dart';
import '../../database/app_preferences.dart';
import '../../services/index.dart';
import '../../style/dimensions.dart';
import '../../utils/custom_permission.dart';
import '../../utils/utility.dart';

class SplashController extends BaseController {
  AppPreferences appPreferences = AppPreferences();
  Services _services = Services();
  int? isViewed;
  GetCustomPermission galleryPermission = GetCustomPermission.gallery();

  @override
  void onInit() async {
    splashTimer();
    // StorageService().clearScope();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViewed = prefs.getInt('onBoard');
    print(isViewed);
    super.onInit();
  }

  void splashTimer() async {
    var _duration = Duration(
      seconds: Dimensions.screenLoadTime,
    );
    Future.delayed(_duration, () async {
      LoginDetails? details = await AppPreferences().getLoginDetails();
      printf("Navigate to next screen");
      try {
        if (await appPreferences.getIsLoggedIn() && details != null) {
          Get.offNamedUntil(Routes.DASHBOARD, (route) => false);
        } else {
          if (isViewed == 0) {
            Get.offNamedUntil(Routes.LOGIN, (route) => false);
          } else {
            Get.offNamedUntil(Routes.INTRO, (route) => false);
          }
        }
      } catch (e) {
        Get.offNamedUntil(Routes.INTRO, (route) => false);
      }
    });
  }

  void changeLanguage(String lang) async {
    await appPreferences.setLanguageCode(lang);
    Get.find<AppController>().changeLanguage();
  }

  void getGalleryPermission() async {
    await galleryPermission.getPermission(Get.context);
    if (galleryPermission.granted) {
      // Ready to do camera access code
      printf("Permission Granted");
    }
  }
}
