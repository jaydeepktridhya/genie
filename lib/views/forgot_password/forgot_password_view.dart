import 'package:flutter/material.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ForgotPasswordController(),
        builder: (ForgotPasswordController controller) {
          return Container(
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
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: Dimensions.screenHeight / 6.5),
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight / 3.5,
                          child: Image.asset(
                            ImagePath.appLogoLogin,
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                           height: Dimensions.screenHeight / 6.5,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              AppConstants.forgotPassword,
                              style: textBold,
                            ),
                            16.verticalSpace,
                            const Text(
                              AppConstants.forgotPasswordInfo,
                              style: textRegular14,
                            ),
                            16.verticalSpace,
                            UiUtils().customTextField(
                                text: AppConstants.emailHeading,
                                hintText: AppConstants.hintEmail,
                                controller: controller.emailCtl,
                                focusNode: controller.emailFn,
                                keyboardType: TextInputType.emailAddress,
                                contentPadding: const EdgeInsets.all(16),
                                textInputAction: TextInputAction.next),
                            16.verticalSpace,
                            UiUtils().appButton(
                              onPressFunction: () {
                                if (controller.validate()) {
                                  controller.forgotPasswordApi(
                                      controller.emailCtl.text.trim());
                                }
                              },
                              buttonText: AppConstants.submit,
                              buttonFillColor: white.withOpacity(0.1),
                              buttonBorderColor: Colors.transparent,
                              buttonTextColor: Colors.white,
                            ),
                            16.verticalSpace,
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Already Have Account ? ',
                                    style: textRegular14,
                                  ),
                                  Text(
                                    'Login Now',
                                    style: textBold14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(24),
                  ),
                ).paddingOnly(top: MediaQuery.of(context).padding.top),
              ),
            ),
          );
        });
  }
}
