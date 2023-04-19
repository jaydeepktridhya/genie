import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genie/style/text_styles.dart';
import 'package:genie/utils/app_constants.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/intro/intro_controller.dart';
import 'package:get/get.dart';
import 'package:open_settings/open_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../utils/utility.dart';

class IntroView extends GetView<IntroController> {
  IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: IntroController(),
      builder: (IntroController controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primary4D,
                primary81,
              ],
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              bottomNavigationBar: UiUtils()
                  .appButton(
                    onPressFunction: () async {
                      Get.toNamed(Routes.TUTORIAL);
                    },
                    buttonText: AppConstants.btnNext,
                    buttonFillColor: white.withOpacity(0.1),
                    buttonBorderColor: Colors.transparent,
                    buttonTextColor: Colors.white,
                  )
                  .paddingOnly(bottom: 28, top: 20, left: 24, right: 24),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        int isViewed = 0;
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setInt('onBoard', isViewed);
                        printf(prefs.getInt('onBoard'));
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        AppConstants.skip,
                        style: textRegularLight,
                        textAlign: TextAlign.end,
                      ).paddingOnly(
                        top: 58,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      ImagePath.introLogo,
                      height: Dimensions.screenHeight / 2.5,
                    ).paddingOnly(top: 20),
                  ),
                  Column(
                    children: [
                      const Text(
                        AppConstants.aiSmartKeyboard,
                        style: textBold,
                      ),
                      const Text(
                        AppConstants.introContent,
                        style: textRegularLight,
                        textAlign: TextAlign.center,
                      ).paddingSymmetric(horizontal: 20, vertical: 16),
                      UiUtils().roundedGradientButton(AppConstants.setupGenie,
                          () {
                        if (GetPlatform.isAndroid) {
                          OpenSettings.openInputMethodSetting();
                        } else {
                          controller.openIOSSettings();
                        }
                      }).paddingSymmetric(vertical: 10, horizontal: 60),
                    ],
                  ),
                ],
              ).paddingOnly(left: 24, right: 24),
            ),
          ),
        );
      },
    );
  }
}
