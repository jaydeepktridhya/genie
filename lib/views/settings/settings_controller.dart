import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:genie/database/app_preferences.dart';
import 'package:genie/utils/image_paths.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/base_controller.dart';
import '../../model/language_model.dart';
import '../../model/theme_model.dart';
import '../../routes/app_pages.dart';
import '../../utils/colors.dart';
import '../../utils/utility.dart';

class SettingsController extends BaseController with WidgetsBindingObserver {
  var isSwitched = true.obs;
  var radioIndex = 0.obs;
  var isPremium = true.obs;
  var isKeyboardEnabled = false.obs;
  var doKeyboardHasFullAccess = false.obs;
  var selectedThemeValueIndex = 0.obs;
  var selectedLangValueIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  List<ThemeModel> themesList = <ThemeModel>[].obs;
  List<LanguageModel> langList = <LanguageModel>[].obs;
  AppPreferences appPreferences = AppPreferences();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  static const methodChannel = MethodChannel('genie.methodChannel');
  final inAppReview = InAppReview.instance;

  @override
  Future<void> onInit() async {
    super.onInit();

    isKeyboardEnabled.value = await checkKeyboardEnabled();
    GetPlatform.isIOS
        ? doKeyboardHasFullAccess.value = await isEnabledFullAccess()
        : true;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        isKeyboardEnabled.value = await checkKeyboardEnabled();
        GetPlatform.isIOS
            ? doKeyboardHasFullAccess.value = await isEnabledFullAccess()
            : true;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void onReady() {
    themesList = [
      ThemeModel(black39, isPremium.value, black25, white),
      ThemeModel(whiteD9, isPremium.value, white, black),
      ThemeModel(brown38, isPremium.value, brown34, black),
      ThemeModel(purpleA7, isPremium.value, purple8A, white),
      ThemeModel(red48, isPremium.value, red3D, black),
      ThemeModel(blueAD, isPremium.value, blue9C, black),
      ThemeModel(red14, isPremium.value, red13, white),
      ThemeModel(yellow16, isPremium.value, yellow11, black),
      ThemeModel(green2F, isPremium.value, green26, white),
      ThemeModel(brown2B, isPremium.value, brown24, white),
      ThemeModel(greyB4, isPremium.value, grey9F, black),
      ThemeModel(purpleAD, isPremium.value, purple63, white)
    ];
    langList = [
      LanguageModel(ImagePath.english, 'English', isChecked: true.obs),
      LanguageModel(ImagePath.uk, 'English(United Kingdom)',
          isChecked: false.obs),
      LanguageModel(ImagePath.espanol, 'Español', isChecked: false.obs),
      LanguageModel(ImagePath.frances, 'Français', isChecked: false.obs),
      LanguageModel(ImagePath.deutsch, 'Deutsch', isChecked: false.obs),
      LanguageModel(ImagePath.portugues, 'Português(Portugal)',
          isChecked: false.obs),
      LanguageModel(ImagePath.brasil, 'português(Brasil)',
          isChecked: false.obs),
      LanguageModel(ImagePath.italino, 'Italiano', isChecked: false.obs),
      LanguageModel(ImagePath.nedherlands, 'Nederlands', isChecked: false.obs),
      LanguageModel(ImagePath.eire, 'Gaeilge (Éire) ', isChecked: false.obs),
      LanguageModel(ImagePath.catala, 'Català', isChecked: false.obs),
    ].obs;
    super.onReady();
  }

  Future<void> openIOSSettings() async {
    try {
      final dynamic result = await methodChannel.invokeMethod('openSettings');
      printf("============= $result");
    } catch (e) {
      printf("Can't fetch the method: '$e'.");
    }
  }

  Future<bool> checkKeyboardEnabled() async {
    var data = false;
    try {
      data = await methodChannel.invokeMethod('checkKeyboardEnabled');
      printf("Keyboard is enabled in :$data");
    } catch (e) {
      printf("Can't fetch the method: '$e'.");
    }
    return data;
  }

  Future<bool> isEnabledFullAccess() async {
    var data = false;
    try {
      data = await methodChannel.invokeMethod('isEnabledFullAccess');
      printf("Keyboard has full access :$data");
    } catch (e) {
      printf("Can't fetch the method: '$e'.");
    }
    return data;
  }

  Future<void> signOut() async {
    Utility().showProgressBarDialog();
    try {
      final isGoogleSignIn = await googleSignIn.isSignedIn();
      if (isGoogleSignIn) {
        await googleSignIn.signOut();
      }
      await firebaseAuth.signOut();
      appPreferences.isLoggedIn(value: false);
      appPreferences.clearData();
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
    } catch (e) {
      Utility.snackBar('Error signing out. Try again.', Get.context!);
    }
  }

  Future<void> openSocialMedia(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode
          .externalApplication, /*
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),*/
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> openStoreListing() => inAppReview.openStoreListing(
    appStoreId: "",
  );

  Future<void> rateAndReview() async {


    if (await inAppReview.isAvailable()) {
      printf('request actual review from store');
      inAppReview.requestReview();
    } else {
      printf('open actual store listing');
      inAppReview.openStoreListing(
        appStoreId: '<your app store id>',
      );
    }
  }
}
