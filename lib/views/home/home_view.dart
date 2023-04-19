import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/utils/image_paths.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/home/home_controller.dart';
import 'package:genie/views/settings/settings_controller.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final SettingsController settingController = Get.put(SettingsController());
  var isKeyboardEnabled = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        initState: (i) {
          isKeyboardEnabled = settingController.isKeyboardEnabled;
        },
        builder: (HomeController controller) {
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
                backgroundColor: Colors.transparent,
                title: Text(
                  'Genie Keyboard',
                  style: textRegularLight.copyWith(
                      fontSize: Dimensions.fontSize18),
                ),
                centerTitle: true,
              ),
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowIndicator();
                  return false;
                },
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: white.withOpacity(0.1),
                      ),
                      child: TabBar(
                        controller: controller.tabController,
                        indicator: const BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        labelPadding: EdgeInsets.zero,
                        indicatorPadding: const EdgeInsets.only(top: 47),
                        unselectedLabelColor: white.withOpacity(0.5),
                        tabs: const [
                          Tab(
                            text: AppConstants.setUp,
                          ),
                          Tab(
                            text: AppConstants.featuresTips,
                          ),
                          Tab(
                            text: AppConstants.help,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            GetPlatform.isIOS
                                ? setUpTabIOS()
                                : setUpTabAndroid(),
                            featuresTab(),
                            helpTab(),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget setUpTabIOS() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              border: Border.all(
                color: white.withOpacity(0.6),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RichText(
              text: TextSpan(
                  text: AppConstants.keyboardStatus,
                  style: textRegular,
                  children: [
                    WidgetSpan(
                      child: SvgPicture.asset(
                        isKeyboardEnabled.value
                            ? ImagePath.icCheckGreen
                            : ImagePath.icWarning,
                        color: isKeyboardEnabled.value ? green71 : red6D,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    TextSpan(
                      text: isKeyboardEnabled.value
                          ? AppConstants.upAndRunning
                          : AppConstants.notOperational,
                      style: textRegular.copyWith(
                        color: isKeyboardEnabled.value ? green71 : red6D,
                      ),
                    )
                  ]),
            ).paddingOnly(left: 16, top: 16, bottom: 16),
          ),
          20.verticalSpace,
          Visibility(
            visible: !isKeyboardEnabled.value,
            child: Column(
              children: [
                Text(
                  AppConstants.keyboardStatusInfo,
                  style: textBold.copyWith(fontSize: Dimensions.fontSize20),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    const Text(
                      '1.',
                      style: textRegular,
                    ),
                    13.horizontalSpace,
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: AppConstants.setupStep1a,
                            style: textRegular,
                            children: <TextSpan>[
                              TextSpan(
                                text: "Settings",
                                style: textBold.copyWith(
                                    fontSize: Dimensions.fontSize16),
                              ),
                              const TextSpan(
                                text: AppConstants.setupStep1b,
                                style: textRegular,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          '2.',
                          style: textRegular,
                        ),
                        13.horizontalSpace,
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: AppConstants.setupStep2aios,
                                style: textRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: AppConstants.setupStep2bios,
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(ImagePath.keyboardInSystemSettingsIOS),
                    ).marginSymmetric(horizontal: 22, vertical: 22),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3.',
                          style: textRegular,
                        ),
                        13.horizontalSpace,
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: "Select ",
                                style: textRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Keyboards",
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(ImagePath.keyboardsInSettingsIOS),
                    ).marginSymmetric(horizontal: 22, vertical: 22),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '4.',
                          style: textRegular,
                        ),
                        13.horizontalSpace,
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: "Enable ",
                                style: textRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Genie AI - Make a Wish!",
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                  const TextSpan(
                                    text: " and",
                                    style: textRegular,
                                  ),
                                  TextSpan(
                                    text: " Allow Full Access",
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(ImagePath.keyboardAccessIOS),
                    ).marginSymmetric(horizontal: 22, vertical: 22),
                    20.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                AppConstants.howToSwitchGenieKey,
                textAlign: TextAlign.center,
                style:
                    textRegularLight.copyWith(fontSize: Dimensions.fontSize18),
              ).marginSymmetric(horizontal: 6),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '1.',
                        style: textRegular,
                      ).paddingOnly(top: 4),
                      13.horizontalSpace,
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: "Tap and hold the ",
                              style: textRegular,
                              children: [
                                WidgetSpan(
                                  child: SvgPicture.asset(
                                    ImagePath.icGlobe,
                                    height: 24,
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(
                                  text: " keyboard key",
                                  style: textRegular,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      const Text(
                        '2.',
                        style: textRegular,
                      ).paddingOnly(top: 4),
                      13.horizontalSpace,
                      const Text(
                        'Select Genie AI - Make a Wish!',
                        style: textRegular,
                      ).paddingOnly(top: 4),
                    ],
                  ),
                  12.verticalSpace,
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Image.asset(ImagePath.keyboardSelectIOS),
                  ).marginSymmetric(horizontal: 22, vertical: 22),
                ],
              ).marginSymmetric(horizontal: 12),
            ],
          )
        ],
      ).paddingOnly(left: 24, right: 24, top: 24),
    );
  }

  Widget setUpTabAndroid() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              border: Border.all(
                color: white.withOpacity(0.6),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RichText(
              text: TextSpan(
                  text: AppConstants.keyboardStatus,
                  style: textRegular,
                  children: [
                    WidgetSpan(
                      child: SvgPicture.asset(
                        isKeyboardEnabled.value
                            ? ImagePath.icCheckGreen
                            : ImagePath.icWarning,
                        color: isKeyboardEnabled.value ? green71 : red6D,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    TextSpan(
                      text: isKeyboardEnabled.value
                          ? AppConstants.upAndRunning
                          : AppConstants.notOperational,
                      style: textRegular.copyWith(
                        color: isKeyboardEnabled.value ? green71 : red6D,
                      ),
                    )
                  ]),
            ).paddingOnly(left: 16, top: 16, bottom: 16),
          ),
          20.verticalSpace,
          Visibility(
            visible: !isKeyboardEnabled.value,
            child: Column(
              children: [
                Text(
                  AppConstants.keyboardStatusInfo,
                  style: textBold.copyWith(fontSize: Dimensions.fontSize20),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    const Text(
                      '1.',
                      style: textRegular,
                    ),
                    13.horizontalSpace,
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: AppConstants.setupStep1a,
                            style: textRegular,
                            children: <TextSpan>[
                              TextSpan(
                                text: "Settings",
                                style: textBold.copyWith(
                                    fontSize: Dimensions.fontSize16),
                              ),
                              const TextSpan(
                                text: AppConstants.setupStep1b,
                                style: textRegular,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    const Text(
                      '2.',
                      style: textRegular,
                    ),
                    13.horizontalSpace,
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: AppConstants.setupStep2Android1,
                            style: textRegular,
                            children: <TextSpan>[
                              TextSpan(
                                text: " System",
                                style: textBold.copyWith(
                                    fontSize: Dimensions.fontSize16),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3.',
                          style: textRegular,
                        ),
                        13.horizontalSpace,
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: "Select ",
                                style: textRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Language & Input",
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(ImagePath.androidSettings),
                    ).marginSymmetric(horizontal: 22, vertical: 22),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '4.',
                          style: textRegular,
                        ),
                        13.horizontalSpace,
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: "Select ",
                                style: textRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "On-screen Keyboards",
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(ImagePath.androidKeyboards),
                    ).marginSymmetric(horizontal: 22, vertical: 22),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '5.',
                          style: textRegular,
                        ),
                        13.horizontalSpace,
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: "Enable ",
                                style: textRegular,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Genie AI - Make a Wish!",
                                    style: textBold.copyWith(
                                        fontSize: Dimensions.fontSize16),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(
                        ImagePath.androidOnScreenKeyboards,
                      ),
                    ).marginSymmetric(horizontal: 22, vertical: 22),
                    20.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                AppConstants.howToSwitchGenieKey,
                textAlign: TextAlign.center,
                style:
                    textRegularLight.copyWith(fontSize: Dimensions.fontSize18),
              ).marginSymmetric(horizontal: 6),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '1.',
                        style: textRegular,
                      ).paddingOnly(top: 4),
                      13.horizontalSpace,
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: "Tap ",
                              style: textRegular,
                              children: [
                                WidgetSpan(
                                  child: SvgPicture.asset(
                                    ImagePath.icKeyboardKey,
                                    height: 24,
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(
                                  text: " keyboard key",
                                  style: textRegular,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      const Text(
                        '2.',
                        style: textRegular,
                      ).paddingOnly(top: 4),
                      13.horizontalSpace,
                      const Text(
                        'Select Genie AI - Make a Wish!',
                        style: textRegular,
                      ).paddingOnly(top: 4),
                    ],
                  ),
                  12.verticalSpace,
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Image.asset(ImagePath.androidInputMethod),
                  ).marginSymmetric(horizontal: 22, vertical: 22),
                ],
              ).marginSymmetric(horizontal: 12),
            ],
          )
        ],
      ).paddingOnly(left: 24, right: 24, top: 24),
    );
  }

  Center featuresTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppConstants.keyboardFeatures,
                  style: textBold.copyWith(fontSize: Dimensions.fontSize18),
                ),
                24.verticalSpace,
                const Text(
                  AppConstants.keyboardFeaturesTitle,
                  style: textRegularLight,
                ),
                24.verticalSpace,
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(GetPlatform.isIOS
                      ? ImagePath.keyboardIOS
                      : ImagePath.keyboardAndroid),
                ),
                18.verticalSpace,
                ListView.builder(
                    itemCount: AppConstants.helpQuestions.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        AppConstants
                                            .keyboardIconPathList[index],
                                        color: Colors.white,
                                        height:
                                            AppConstants.keyboardIconPathList[
                                                        index] ==
                                                    ImagePath.icEmailReplyWhite
                                                ? 20
                                                : 24,
                                        width:
                                            AppConstants.keyboardIconPathList[
                                                        index] ==
                                                    ImagePath.icEmailReplyWhite
                                                ? 20
                                                : 24),
                                    12.horizontalSpace,
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                            text: AppConstants
                                                .keyboardHeaderTitleList[index],
                                            style: textBold16,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: AppConstants
                                                        .keyboardHeaderDetailsList[
                                                    index],
                                                style: textRegularLight,
                                              )
                                            ]),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }).paddingOnly(bottom: 20),
                Text(
                  AppConstants.tipsForBestExp,
                  style: textRegularLight.copyWith(
                      fontSize: Dimensions.fontSize18),
                ),
                20.verticalSpace,
                ListView.builder(
                    itemCount: AppConstants.keyboardTipsList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var serialNo = index + 1;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${serialNo.toString()}. ',
                                      style: textRegular,
                                    ),
                                    12.horizontalSpace,
                                    Flexible(
                                      child: Text(
                                        AppConstants.keyboardTipsList[index],
                                        style: textRegularLight,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }).paddingOnly(bottom: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center helpTab() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Text(
                AppConstants.keyboardHelp,
                style: textBold.copyWith(fontSize: Dimensions.fontSize18),
              ),
            ),
            24.verticalSpace,
            ListView.builder(
                itemCount: AppConstants.helpQuestions.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Q.',
                                  style: textRegular,
                                ),
                                13.horizontalSpace,
                                Flexible(
                                  child: Text(
                                    AppConstants.helpQuestions[index],
                                    style: textRegularLight,
                                  ),
                                ),
                              ],
                            ),
                            9.verticalSpace,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'A.',
                                  style: textRegular,
                                ),
                                13.horizontalSpace,
                                Flexible(
                                  child: Text(
                                    AppConstants.helpAnswers[index],
                                    style: textRegularLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      Divider(
                        height: 2,
                        color: white.withOpacity(0.1),
                      ),
                      24.verticalSpace
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
