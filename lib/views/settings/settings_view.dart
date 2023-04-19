import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/settings/settings_controller.dart';
import 'package:get/get.dart';
import 'package:open_settings/open_settings.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/theme_model.dart';
import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../utils/utility.dart';
import '../../widgets/custom_switch.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  SettingsController settingsController =
      Get.put(SettingsController(), tag: DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SettingsController(),
        builder: (SettingsController controller) {
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
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: AppBar().preferredSize.height,
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.toNamed(Routes.KEYBOARDINFO);
                      },
                      child: SvgPicture.asset(
                        ImagePath.infoIcon,
                        height: 24,
                        width: 24,
                        color: white,
                      ),
                    ),
                    Text(
                      AppConstants.setting,
                      style: textRegularLight.copyWith(
                          fontSize: Dimensions.fontSize18),
                    ).paddingOnly(right: 14),
                    InkWell(
                            splashFactory: NoSplash.splashFactory,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed(Routes.PROFILE);
                            },
                            child: SvgPicture.asset(ImagePath.userIcon,
                                color: white))
                        .paddingOnly(right: 6),
                  ],
                ),
              ),
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimensions.screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                blueBC,
                                blueBD,
                              ],
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, top: 24, bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppConstants.genie,
                                  style: textRegular.copyWith(
                                      fontSize: Dimensions.fontSize24,
                                      color: white)),
                              12.verticalSpace,
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.icTick,
                                      color: white),
                                  10.horizontalSpace,
                                  Text('AI keyboard with 20+ Features',
                                      style: textRegularLight.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: white)),
                                ],
                              ),
                              5.verticalSpace,
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.icTick,
                                      color: white),
                                  10.horizontalSpace,
                                  Text('Unlimited Chat with Smart AI',
                                      style: textRegularLight.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: white)),
                                ],
                              ),
                              5.verticalSpace,
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.icTick,
                                      color: white),
                                  10.horizontalSpace,
                                  Text('20+ Keyboard Themes',
                                      style: textRegularLight.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      UiUtils().customContainer(
                        ImagePath.upgrade,
                        whiteFA,
                        AppConstants.upgradetoPro,
                        ImagePath.arrow,
                        () {
                          Get.toNamed(Routes.UPGRADE);
                        },
                        true,
                        whiteFA,
                      ),
                      //TODO future
                      /*6.verticalSpace,
                      UiUtils().customContainer(ImagePath.restore, whiteFA,
                          AppConstants.restorePurchases, ImagePath.arrow, () {
                        Get.dialog(AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          insetPadding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 32),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(AppConstants.restoreUnsuccessful,
                                  textAlign: TextAlign.center,
                                  style: textBold.copyWith(color: black0A)),
                              8.verticalSpace,
                              Text(AppConstants.purchasesFoundtoRestore,
                                  textAlign: TextAlign.center,
                                  style:
                                      textRegularLight.copyWith(color: grey7A)),
                            ],
                          ).paddingSymmetric(horizontal: 28, vertical: 24),
                          actions: [
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(Get.overlayContext!,
                                        rootNavigator: true)
                                    .pop();
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, left: 20, right: 20),
                                  child: UiUtils()
                                      .roundedButton(AppConstants.oK, () {
                                    Navigator.of(Get.overlayContext!,
                                            rootNavigator: true)
                                        .pop();
                                  })),
                            ),
                          ],
                        ));
                      }, true, whiteFA),*/
                      32.verticalSpace,
                      const Text(AppConstants.keyboardSettings,
                          style: textRegular),
                      16.verticalSpace,
                      Obx(
                        () => UiUtils().customDynamicContainer(
                            ImagePath.enable,
                            AppConstants.keyboardEnabled,
                            () {},
                            controller.isKeyboardEnabled.value),
                      ),
                     /* 6.verticalSpace,
                      Obx(
                        () => UiUtils().customDynamicContainer(
                            ImagePath.location,
                            AppConstants.fullAccessDisabled,
                            () {},
                            GetPlatform.isAndroid
                                ? controller.isKeyboardEnabled.value
                                : controller.doKeyboardHasFullAccess.value),
                      ),*/
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.settingIcon, whiteFA,
                          AppConstants.systemSettings, ImagePath.arrow, () {
                        if (GetPlatform.isAndroid) {
                          OpenSettings.openInputMethodSetting();
                        } else {
                          controller.openIOSSettings();
                        }
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.infoIcon, whiteFA,
                          AppConstants.keyboardInfo, ImagePath.arrow, () {
                        Get.toNamed(Routes.KEYBOARDINFO);
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.theme, whiteFA,
                          AppConstants.keyboardThemes, ImagePath.arrow, () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                  initialChildSize: 0.9,
                                  builder: (context, scrollController) {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      child: Container(
                                        color: black25,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              color: black25,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                              ),
                                              child: FractionallySizedBox(
                                                widthFactor: 0.12,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 8.0,
                                                  ),
                                                  child: Container(
                                                    height: 5.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: grey72,
                                                      // color of top divider bar
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: black25,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                              ),
                                              child: FractionallySizedBox(
                                                widthFactor: 0.25,
                                                child: const Text(
                                                  AppConstants.comingSoon,
                                                  style: textRegular14,
                                                ).paddingOnly(top: 12),
                                              ),
                                            ),
                                            Expanded(
                                                child: GridView.count(
                                                        crossAxisCount: 2,
                                                        physics:
                                                            const ScrollPhysics(),
                                                        controller:
                                                            scrollController,
                                                        childAspectRatio:
                                                            Dimensions
                                                                    .screenHeight /
                                                                550,
                                                        crossAxisSpacing: 19.0,
                                                        shrinkWrap: true,
                                                        mainAxisSpacing: 24.0,
                                                        children:
                                                            List.generate(
                                                                controller
                                                                    .themesList
                                                                    .length,
                                                                (index) {
                                                          return Obx(
                                                            () => Center(
                                                              child: themeGridView(
                                                                  controller
                                                                          .themesList[
                                                                      index],
                                                                  index,
                                                                  controller
                                                                      .selectedThemeValueIndex
                                                                      .value,
                                                                  () {
                                                                controller
                                                                    .selectedThemeValueIndex
                                                                    .value = index;
                                                              }),
                                                            ),
                                                          );
                                                        }))
                                                    .paddingOnly(
                                                        top: 34,
                                                        left: 24,
                                                        right: 24,
                                                        bottom: 8))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            });
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.language, whiteFA,
                          AppConstants.keyboardLanguages, ImagePath.arrow, () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                  initialChildSize: 0.9,
                                  builder: (context, scrollController) {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      child: Container(
                                        color: black25,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              color: black25,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                              ),
                                              child: FractionallySizedBox(
                                                widthFactor: 0.12,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 8.0,
                                                  ),
                                                  child: Container(
                                                    height: 5.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: grey72,
                                                      // color of top divider bar
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  100)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: black25,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                left: 0,
                                                right: 0,
                                              ),
                                              child: FractionallySizedBox(
                                                widthFactor: 0.25,
                                                child: const Text(
                                                  AppConstants.comingSoon,
                                                  style: textRegular14,
                                                ).paddingOnly(top: 12),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  itemCount: controller
                                                      .langList.length,
                                                  physics:
                                                      const ScrollPhysics(),
                                                  controller: scrollController,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Obx(() => InkWell(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () {
                                                          controller
                                                                  .langList[index]
                                                                  .isChecked
                                                                  .value =
                                                              !controller
                                                                  .langList[
                                                                      index]
                                                                  .isChecked
                                                                  .value;
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: black25),
                                                            color: black25,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Image.asset(controller
                                                                      .langList[
                                                                          index]
                                                                      .icon),
                                                                  15.horizontalSpace,
                                                                  Text(
                                                                    controller
                                                                        .langList[
                                                                            index]
                                                                        .text,
                                                                    style:
                                                                        textRegularLight,
                                                                  ),
                                                                ],
                                                              ),
                                                              InkWell(
                                                                splashFactory:
                                                                    NoSplash
                                                                        .splashFactory,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap: () {
                                                                  controller
                                                                          .langList[
                                                                              index]
                                                                          .isChecked
                                                                          .value =
                                                                      !controller
                                                                          .langList[
                                                                              index]
                                                                          .isChecked
                                                                          .value;
                                                                },
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  controller
                                                                          .langList[
                                                                              index]
                                                                          .isChecked
                                                                          .value
                                                                      ? ImagePath
                                                                          .checkBoxFilled
                                                                      : ImagePath
                                                                          .checkBoxEmpty,
                                                                  height: 20,
                                                                  width: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          ).paddingOnly(
                                                              left: 31,
                                                              top: 21,
                                                              bottom: 30,
                                                              right: 19),
                                                        )));
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            });
                      }, true, whiteFA),
                      //TODO if Heptic feedback needed
                      /* 6.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, bottom: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.feedback,
                                    color: whiteFA,
                                  ),
                                  14.horizontalSpace,
                                  Text(AppConstants.hapticFeedback,
                                      style: textRegularLight.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: whiteFA)),
                                ],
                              ),
                              Obx(
                                () => CustomSwitch(
                                  value: controller.isSwitched.value,
                                  onChanged: (value) {
                                    print("VALUE : $value");

                                    controller.isSwitched.value = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      32.verticalSpace,
                      const Text(AppConstants.profile, style: textRegular),
                      16.verticalSpace,
                      UiUtils().customContainer(ImagePath.userIcon, whiteFA,
                          AppConstants.profileInfo, ImagePath.arrow, () {
                        Get.toNamed(Routes.PROFILE);
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.logout, whiteFA,
                          AppConstants.signOut, ImagePath.arrow, () {
                        Get.dialog(AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          insetPadding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 38),
                          content: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 40),
                            child: Text(AppConstants.signoutConfirm,
                                textAlign: TextAlign.center,
                                style: textRegular20.copyWith(color: black0A)),
                          ),
                          actions: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 20, right: 20),
                                child: UiUtils().roundedButton(
                                    AppConstants.signOut, () async {
                                  await controller.signOut();
                                  Utility().hideProgressBarDialog();
                                })),
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(Get.overlayContext!,
                                        rootNavigator: true)
                                    .pop();
                              },
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 16),
                                child: Text(AppConstants.cancel,
                                    style:
                                        textRegular.copyWith(color: black0A)),
                              )),
                            ),
                          ],
                        ));
                      }, true, whiteFA),
                      32.verticalSpace,
                      const Text(AppConstants.socialMedia,
                          style: textRegular),
                      16.verticalSpace,
                      UiUtils().customContainer(ImagePath.fbIcon, whiteFA,
                          AppConstants.genieOnFb, ImagePath.arrow, () {
                        controller.openSocialMedia(AppConstants.fbUrl);
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.tiktok, whiteFA,
                          AppConstants.genieonTikTok, ImagePath.arrow, () {
                        controller.openSocialMedia(AppConstants.tiktokUrl);
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.instagram, whiteFA,
                          AppConstants.genieonInstagram, ImagePath.arrow, () {
                        controller.openSocialMedia(AppConstants.instagramUrl);
                      }, true, whiteFA),
                      32.verticalSpace,
                      const Text(AppConstants.spreadTheWord,
                          style: textRegular),
                      16.verticalSpace,
                      UiUtils().customContainer(ImagePath.star, whiteFA,
                          AppConstants.loveGenie, ImagePath.arrow, () {
                            controller.openStoreListing();
                        /*showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => ratingDialog(controller),
                        );*/
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.share, whiteFA,
                          AppConstants.sharewithaFriend, ImagePath.arrow, () {
                        Share.share(AppConstants.shareWithContent);
                      }, true, whiteFA),
                      32.verticalSpace,
                      const Text(AppConstants.supportandPrivacy,
                          style: textRegular),
                      16.verticalSpace,
                      /*UiUtils().customContainer(ImagePath.help, whiteFA,
                          '${AppConstants.needHelp}?', ImagePath.arrow, () {
                        Get.toNamed(Routes.WEBVIEW, arguments: {
                          'postUrl': AppConstants.needHelpUrl,
                          'title': AppConstants.needHelp
                        });
                      }, true, whiteFA),
                      6.verticalSpace,*/
                      UiUtils().customContainer(ImagePath.about, whiteFA,
                          AppConstants.aboutGenie, ImagePath.arrow, () {
                        Get.toNamed(Routes.WEBVIEW, arguments: {
                          'postUrl': AppConstants.aboutGenieUrl,
                          'title': AppConstants.aboutGenie
                        });
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.privacy, whiteFA,
                          AppConstants.privacyPolicy, ImagePath.arrow, () {
                        Get.toNamed(Routes.WEBVIEW, arguments: {
                          'postUrl': AppConstants.privacyPolicyUrl,
                          'title': AppConstants.privacyPolicy
                        });
                      }, true, whiteFA),
                      6.verticalSpace,
                      UiUtils().customContainer(ImagePath.terms, whiteFA,
                          AppConstants.termsofUse, ImagePath.arrow, () {
                        Get.toNamed(Routes.WEBVIEW, arguments: {
                          'postUrl': AppConstants.termsofUseUrl,
                          'title': AppConstants.termsofUse
                        });
                      }, true, whiteFA),
                      /*18.verticalSpace,
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppConstants.version,
                            style: textRegular12.copyWith(color: grey9F),
                          )),*/
                      26.verticalSpace,
                    ],
                  ).paddingOnly(left: 24.0, right: 24.0, top: 24),
                ),
              ),
            ),
          );
        });
  }

  Widget themeGridView(
    ThemeModel data,
    int index,
    int selectedValueIndex,
    VoidCallback? onTap,
  ) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: data.bgColor),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
                right: 45,
                child: Visibility(
                    visible: data.isPremimumVisible,
                    child: Image.asset(
                      ImagePath.premium,
                      height: 38,
                      width: 38,
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: data.textBgColor),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "A",
                      style: textRegular40.copyWith(color: data.textColor),
                    ),
                  ).paddingSymmetric(horizontal: 8),
                ).paddingOnly(
                  left: 12,
                  top: 12,
                  bottom: 12,
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          gradient: index == selectedValueIndex
                              ? const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [blueBC, blueBD],
                                )
                              : const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [greyD0, greyD0],
                                ),
                          shape: BoxShape.circle),
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingDialog(SettingsController settingsController) {
    return RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => printf('cancelled'),
      onSubmitted: (response) {
        printf(
            'Store rating: ${response.rating}, comment: ${response.comment}');
        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          settingsController.rateAndReview();
        }
      },
    );
  }
}
