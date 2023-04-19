import 'package:flutter/material.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/register/register_controller.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RegisterController(),
        builder: (RegisterController controller) {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              ImagePath.appLogoLogin,
                              height: Dimensions.screenHeight / 8,
                            ),
                          ),
                          const Text(
                            AppConstants.registerHeading,
                            style: textBold,
                          ),
                          18.verticalSpace,
                          UiUtils().customTextField(
                              text: AppConstants.headingName,
                              hintText: AppConstants.hintName,
                              controller: controller.nameCtl,
                              focusNode: controller.nameFn,
                              keyboardType: TextInputType.name,
                              contentPadding: EdgeInsets.all(16),
                              textInputAction: TextInputAction.next),
                          18.verticalSpace,
                          UiUtils().customTextField(
                              text: AppConstants.emailHeading,
                              hintText: AppConstants.hintEmail,
                              controller: controller.emailCtl,
                              focusNode: controller.emailFn,
                              keyboardType: TextInputType.emailAddress,
                              contentPadding: EdgeInsets.all(16),
                              textInputAction: TextInputAction.next),
                          18.verticalSpace,
                          Obx(
                            () => UiUtils().customTextField(
                                text: AppConstants.passwordHeading,
                                hintText: AppConstants.hintPwd,
                                obscureText: controller.isVisiblePwd.value,
                                controller: controller.passwordCtl,
                                focusNode: controller.passwordFn,
                                keyboardType: TextInputType.visiblePassword,
                                contentPadding: EdgeInsets.all(16),
                                textInputAction: TextInputAction.next,
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
                                    ))

                                /* SvgPicture.asset(
                                ImagePath.visibilityOn,
                                color: white,
                                height: 5,
                                width: 10,
                              )*/
                                ),
                          ),
                          18.verticalSpace,
                          Obx(
                            () => UiUtils().customTextField(
                                text: AppConstants.passwordRepeatHeading,
                                hintText: AppConstants.hintPwd,
                                obscureText:
                                    controller.isVisibleConfirmPwd.value,
                                controller: controller.passwordRepeatCtl,
                                focusNode: controller.passwordRepeatFn,
                                keyboardType: TextInputType.visiblePassword,
                                contentPadding: EdgeInsets.all(16),
                                textInputAction: TextInputAction.done,
                                suffixIcon: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      controller.isVisibleConfirmPwd.value =
                                          !controller.isVisibleConfirmPwd.value;
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 14.0),
                                      child: Image.asset(
                                        height: 18,
                                        width: 18,
                                        controller.isVisibleConfirmPwd.value ==
                                                false
                                            ? ImagePath.visibilityOn
                                            : ImagePath.visibilityOff,
                                        color: white,
                                      ),
                                    ))
                                /* SvgPicture.asset(
                                ImagePath.visibilityOn,
                                color: white,
                                height: 5,
                                width: 10,
                              )*/
                                ),
                          ),
                          20.verticalSpace,
                          UiUtils().appButton(
                            onPressFunction: () {
                              if (controller.validate()) {
                                controller.registerAPI(
                                    controller.emailCtl.text,
                                    controller.passwordCtl.text,
                                    controller.nameCtl.text,
                                    "",
                                    "");
                              }
                            },
                            buttonText: AppConstants.btnRegister,
                            buttonFillColor: white.withOpacity(0.1),
                            buttonBorderColor: Colors.transparent,
                            buttonTextColor: Colors.white,
                          ),
                          18.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already Have Account ? ',
                                style: textRegular14,
                              ),
                              InkWell(
                                splashFactory: NoSplash.splashFactory,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Get.offNamedUntil(
                                      Routes.LOGIN, (route) => false);
                                },
                                child: const Text(
                                  'Login Now',
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
                                AppConstants.registerWithGoogle,
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
                              child: UiUtils().roundButtonWithIcon(
                                  AppConstants.signupWithApple,
                                  textRegular,
                                  ImagePath.icApple),
                            ),
                          ),
                        ],
                      ).paddingOnly(top: 4, bottom: 24, right: 24, left: 24),
                    ).paddingOnly(top: MediaQuery.of(context).padding.top),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
