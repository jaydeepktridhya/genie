import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/chat/chat_view.dart';
import 'package:genie/views/settings/settings_view.dart';
import 'package:get/get.dart';

import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../home/home_view.dart';
import 'dashboard_controller.dart';

class DashBoardView extends GetView<DashBoardController> {
  final DashBoardController dashboardController =
      Get.put(DashBoardController());

  DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
          body: homeScreenWidget(
              dashboardController.rootPageIndex.value, context),
          bottomNavigationBar: buildBottomBar(context),
        ),
      ),
    );
  }

  Container buildBottomBar(BuildContext context) {
    return Container(
      height: Dimensions.screenWidth / 5.4,
      decoration: BoxDecoration(
        color: white.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          columnWidget(ImagePath.homeIcon,
              dashboardController.rootPageIndex.value, 0, 'Keyboard'),
          columnWidget(ImagePath.chatIcon,
              dashboardController.rootPageIndex.value, 1, 'Chat'),
          columnWidget(ImagePath.settingsIcon,
              dashboardController.rootPageIndex.value, 2, 'Settings'),
          // columnWidget(ImagePath.wishesIcon,
          //     dashboardController.rootPageIndex.value, 3, 'Write'),
        ],
      ),
    );
  }

  Widget columnWidget(
    String icon,
    int rootPageIndex,
    int index,
    String title,
  ) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        dashboardController.changeRootPageIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 11.0, bottom: 11.0),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: 22,
              width: 22,
              color: rootPageIndex == index ? white : white.withOpacity(0.5),
            ),
            7.verticalSpace,
            Text(
              title,
              style: textRegular12.copyWith(
                  color:
                      rootPageIndex == index ? white : white.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }

  Widget homeScreenWidget(int index, BuildContext context) {
    switch (index) {
      case 0:
        dashboardController.rootPageIndex.value = 0;
        // return Event();
        return HomeView();
      case 1:
        dashboardController.rootPageIndex.value = 1;
        return ChatView();
      case 2:
        dashboardController.rootPageIndex.value = 2;
        return SettingsView();
      // case 3:
      //   dashboardController.rootPageIndex.value = 3;
      //   return WishesView();
      default:
        return HomeView();
    }
  }
}
