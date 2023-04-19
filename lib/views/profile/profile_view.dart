import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/views/dashboard/dashboard_controller.dart';
import 'package:genie/views/profile/profile_controller.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../utils/utility.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[blueBC, blueBD],
    ).createShader(const Rect.fromLTWH(48.0, 467.0, 279.0, 24.0));
    return GetBuilder(
        init: ProfileController(),
        initState: (i) {
          if (Get.find<DashBoardController>()
              .details
              .profilePicPath
              .toString()
              .isNotEmpty) {
            profileController.profilePath.value =
                Get.find<DashBoardController>().details.profilePicPath!;
          } else {
            profileController.profilePath.value = "";
          }
        },
        builder: (ProfileController controller) {
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
                  body: Stack(children: [
                    Container(
                      height: Dimensions.screenHeight,
                      width: Dimensions.screenWidth,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImagePath.bgImg,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ).paddingOnly(
                        left: 24, top: MediaQuery.of(context).padding.top + 12),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 31, right: 31),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white.withOpacity(0.12),
                          ),
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Text(AppConstants.profileInfo,
                                      textAlign: TextAlign.center,
                                      style: textBold),
                                ),
                                20.verticalSpace,
                                controller.profilePath.value.startsWith("http")
                                    ? CircleAvatar(
                                        radius: 55,
                                        backgroundImage: NetworkImage(
                                          controller.profilePath.value,
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 55,
                                        child: SvgPicture.asset(
                                          ImagePath.userIcon,
                                        ),
                                      ),
                                16.verticalSpace,
                                Text(controller.userName.value,
                                    textAlign: TextAlign.center,
                                    style: textRegular.copyWith(
                                        fontSize: Dimensions.fontSize22)),
                                8.verticalSpace,
                                Text(controller.userEmail.value,
                                    textAlign: TextAlign.center,
                                    style: textRegularLight),
                                20.verticalSpace,
                                Text(AppConstants.freePlan,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Inter',
                                        foreground: Paint()
                                          ..shader = linearGradient)),
                                20.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 71, right: 71),
                                  child: UiUtils().roundedButton(
                                      AppConstants.editProfile, () {
                                    Get.toNamed(Routes.EDITPROFILE)
                                        ?.then((value) {
                                      var data;
                                      data = (value as Map)['changedProfile'];
                                      if (data.toString() == 'true') {
                                        controller.getProfileApi(controller
                                            .details!.userId
                                            .toString());
                                      }
                                    });
                                    ;
                                  }),
                                ),
                                24.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 17, left: 17, right: 17),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(16),
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          16))),
                                              backgroundColor: black25,
                                              // <-- SEE HERE
                                              builder: (context) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    FractionallySizedBox(
                                                      widthFactor: 0.12,
                                                      child: Container(
                                                        margin: const EdgeInsets
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
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            100)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    35.verticalSpace,
                                                    Text(
                                                        controller
                                                            .userName.value,
                                                        style: textRegular.copyWith(
                                                            fontSize: Dimensions
                                                                .fontSize22)),
                                                    24.verticalSpace,
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 26, right: 26),
                                                      child: Text(
                                                          '${AppConstants.deleteInfo} ${controller.userEmail.value}'
                                                          '${AppConstants.deleteInfo2}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              textRegularLight),
                                                    ),
                                                    30.verticalSpace,
                                                    const Text(
                                                        AppConstants
                                                            .deleteInfo1,
                                                        style:
                                                            textRegularLight),
                                                    36.verticalSpace,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 47,
                                                              right: 47),
                                                      child: UiUtils()
                                                          .roundedButton(
                                                              AppConstants
                                                                  .authenticate,
                                                              () {
                                                        controller
                                                            .deleteAccountApi(
                                                                controller
                                                                    .details!
                                                                    .userId
                                                                    .toString());
                                                      }),
                                                    ),
                                                    14.verticalSpace,
                                                    InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          AppConstants.cancel,
                                                          style: textRegular),
                                                    ),
                                                    45.verticalSpace
                                                  ],
                                                );
                                              });
                                        },
                                        child: SvgPicture.asset(
                                          ImagePath.delete,
                                        ),
                                      ),
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        highlightColor: Colors.transparent,
                                        child: SvgPicture.asset(
                                          ImagePath.profileLogout,
                                        ),
                                        onTap: () {
                                          Get.dialog(AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 38),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 32,
                                                      horizontal: 40),
                                              child: Text(
                                                  AppConstants.signoutConfirm,
                                                  textAlign: TextAlign.center,
                                                  style: textRegular20.copyWith(
                                                      color: black0A)),
                                            ),
                                            actions: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8,
                                                          left: 20,
                                                          right: 20),
                                                  child: UiUtils()
                                                      .roundedButton(
                                                          AppConstants.signOut,
                                                          () async {
                                                    await controller.signOut();
                                                    Utility()
                                                        .hideProgressBarDialog();
                                                  })),
                                              InkWell(
                                                splashFactory:
                                                    NoSplash.splashFactory,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () {
                                                  Navigator.of(
                                                          Get.overlayContext!,
                                                          rootNavigator: true)
                                                      .pop();
                                                },
                                                child: Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8, bottom: 16),
                                                  child: Text(
                                                      AppConstants.cancel,
                                                      style:
                                                          textRegular.copyWith(
                                                              color: black0A)),
                                                )),
                                              ),
                                            ],
                                          ));
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ])));
        });
  }
}
