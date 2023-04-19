import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/upgrade/upgrade_controller.dart';
import 'package:get/get.dart';

import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';

class UpgradeView extends GetView<UpgradeController> {
  const UpgradeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UpgradeController(),
        builder: (UpgradeController controller) {
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
                leading: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppConstants.genie,
                          style: textRegular.copyWith(
                              fontSize: Dimensions.fontSize24, color: blueE3),
                        ),
                        24.verticalSpace,
                        const Text(
                          AppConstants.upgradeInfo,
                          style: textRegularLight,
                        ),
                        32.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            UiUtils().gradientContainer(ImagePath.translate,
                                AppConstants.translateInfo, () {}),
                            17.horizontalSpace,
                            UiUtils().gradientContainer(ImagePath.magicpen,
                                AppConstants.magicInfo, () {}),
                            17.horizontalSpace,
                            UiUtils().gradientContainer(ImagePath.upgradeEdit,
                                AppConstants.editInfo, () {}),
                          ],
                        ),
                        22.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            UiUtils().gradientContainer(ImagePath.cardEdit,
                                AppConstants.themeInfo, () {}),
                            17.horizontalSpace,
                            UiUtils().gradientContainer(ImagePath.messageEdit,
                                AppConstants.messageInfo, () {}),
                            17.horizontalSpace,
                            UiUtils().gradientContainer(ImagePath.receiptEdit,
                                AppConstants.receiptInfo, () {}),
                          ],
                        ),
                        32.verticalSpace,
                        Column(
                          children: [
                            /*ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => UiUtils().purchaseListview(
                                        () {
                                          controller.selectedValueIndex.value =
                                              index;
                                        },
                                        'Save 50%',
                                        '3-day FREE trial',
                                        "Yearly \$ 79.99",
                                        index,
                                        controller.selectedValueIndex.value,
                                        () {
                                          controller.selectedValueIndex.value =
                                              index;
                                        }),
                                  );
                                }),*/
                            UiUtils().staticLabel(AppConstants.freeTrialText),
                          ],
                        ),
                        24.verticalSpace,
                     //TODO future
                     /*   UiUtils().roundedButton(AppConstants.startFreeTrial,
                            () {
                          // Get.toNamed(Routes.EDITPROFILE);
                        }),
                        9.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImagePath.restore,
                              height: 18,
                            ),
                            10.horizontalSpace,
                            Text(AppConstants.restorePurchases,
                                style: textRegular.copyWith(
                                    fontSize: Dimensions.fontSizeSmall)),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
