import 'package:flutter/material.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        initState: (i) {
          loginController.loadUserEmailPassword();
        },
        builder: (LoginController controller) {
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
            child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overScroll) {
                      overScroll.disallowIndicator();
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                ImagePath.appLogoLogin,
                                height: Dimensions.screenHeight / 4,
                              ),
                            ),
                            const Text(
                              AppConstants.loginHeading,
                              style: textBold,
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
                            18.verticalSpace,
                            Obx(
                              () => UiUtils().customTextField(
                                text: AppConstants.passwordHeading,
                                hintText: AppConstants.hintPwd,
                                controller: controller.passwordCtl,
                                focusNode: controller.passwordFn,
                                obscureText: controller.isVisiblePwd.value,
                                contentPadding: const EdgeInsets.all(16),
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                suffixIcon: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      controller.isVisiblePwd.value =
                                          !controller.isVisiblePwd.value;
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 14.0),
                                      child: Image.asset(
                                        height: 18,
                                        width: 18,
                                        controller.isVisiblePwd.value == false
                                            ? ImagePath.visibilityOn
                                            : ImagePath.visibilityOff,
                                        color: white,
                                      ),
                                    )),
                                /* SvgPicture.asset(
                                ImagePath.visibilityOn,
                                color: white,
                                height: 5,
                                width: 10,
                              )*/
                              ),
                            ),
                            18.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(() => Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: greyD0),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Checkbox(
                                            activeColor: Colors.transparent,
                                            side: BorderSide.none,
                                            focusColor: Colors.transparent,
                                            value: controller.isChecked.value,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            onChanged: (value) {
                                              controller.toggleRemember();
                                            }))),
                                    12.horizontalSpace,
                                    const Text(
                                      AppConstants.headingRemember,
                                      style: textRegular14,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      splashFactory: NoSplash.splashFactory,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        Get.offNamedUntil(Routes.FORGOTPASSWORD,
                                            (route) => false);
                                      },
                                      child: const Text(
                                        AppConstants.headingForgotPwd,
                                        style: textRegular14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            21.verticalSpace,
                            UiUtils().appButton(
                              onPressFunction: () {
                                if (controller.validate()) {
                                  controller.handleRememberMe();
                                  controller.loginAPI(controller.emailCtl.text,
                                      controller.passwordCtl.text);
                                }
                              },
                              buttonText: AppConstants.btnLogin,
                              buttonFillColor: white.withOpacity(0.1),
                              buttonBorderColor: Colors.transparent,
                              buttonTextColor: Colors.white,
                            ),
                            16.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don’t Have Account ? ',
                                  style: textRegular14,
                                ),
                                InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Get.offNamedUntil(
                                        Routes.REGISTER, (route) => false);
                                  },
                                  child: const Text(
                                    'Register Now',
                                    style: textBold14,
                                  ),
                                ),
                              ],
                            ),
                            16.verticalSpace,
                            Center(
                              child: Text(
                                'Or',
                                style: textRegular14.copyWith(
                                    color: white.withOpacity(0.5)),
                              ),
                            ),
                            16.verticalSpace,
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await controller.googleSignInMethod();
                              },
                              child: UiUtils().roundButtonWithIcon(
                                  AppConstants.loginWithGoogle,
                                  textRegular,
                                  ImagePath.icGoogle),
                            ),
                            16.verticalSpace,
                            Visibility(
                              visible: GetPlatform.isIOS,
                              child: InkWell(
                                splashFactory: NoSplash.splashFactory,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await controller.appleSignInMethod();
                                },
                                child: UiUtils()
                                    .roundButtonWithIcon(
                                        AppConstants.loginWithApple,
                                        textRegular,
                                        ImagePath.icApple)
                                    .paddingOnly(bottom: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).paddingOnly(top: MediaQuery.of(context).padding.top),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
