import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:genie/utils/utility.dart';
import 'package:genie/utils/validations.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import 'edit_profile_controller.dart';
import 'profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({Key? key}) : super(key: key);
  final EditProfileController controller = Get.put(EditProfileController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditProfileController(),
        initState: (i) {
          controller.nameCtl =
              TextEditingController(text: profileController.userName.value);
        },
        builder: (EditProfileController controller) {
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
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
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
                        Get.back(result: {"changedProfile": "false"});
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Text(AppConstants.editYourProfile,
                                        textAlign: TextAlign.center,
                                        style: textBold),
                                  ),
                                  20.verticalSpace,
                                  Stack(children: [
                                    controller.pickedImageFile != null
                                        ? CircleAvatar(
                                            radius: 55,
                                            backgroundImage: FileImage(
                                              File(controller
                                                  .pickedImageFile!.path),
                                            ),
                                          )
                                        : profileController.profilePath.value
                                                .startsWith("http")
                                            ? CircleAvatar(
                                                radius: 55,
                                                backgroundImage: NetworkImage(
                                                  profileController
                                                      .profilePath.value,
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: 55,
                                                child: SvgPicture.asset(
                                                  ImagePath.userIcon,
                                                ),
                                              ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [blueBC, blueBD],
                                              )),
                                          child: InkWell(
                                            onTap: () {
                                              buildImageDialog(
                                                context,
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: SvgPicture.asset(
                                                ImagePath.edit,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ]),
                                  24.verticalSpace,
                                  UiUtils().customTextField(
                                      text: AppConstants.headingName,
                                      controller: controller.nameCtl,
                                      focusNode: controller.nameFn,
                                      keyboardType: TextInputType.name,
                                      contentPadding: const EdgeInsets.all(16),
                                      textInputAction: TextInputAction.done),
                                  16.verticalSpace,
                                  UiUtils().customTextField(
                                      text: AppConstants.emailHeading,
                                      controller: controller.emailCtl
                                        ..text =
                                            profileController.userEmail.value,
                                      contentPadding: EdgeInsets.all(16),
                                      readOnly: true,
                                      style: textRegularLight.copyWith(
                                          color: greyD0)),
                                  24.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 71, right: 71, bottom: 36),
                                    child: UiUtils()
                                        .roundedButton(AppConstants.save, () {
                                      if (controller.nameCtl.text.isNotEmpty) {
                                        controller.updateProfileApi(
                                            controller.nameCtl.text.toString(),
                                            controller.pickedImageFile?.path);
                                      } else {
                                        Utility.snackBar(
                                            ValidationConstants.emptyName,
                                            Get.context!);
                                      }
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ])),
            ),
          );
        });
  }

  Future<void> buildImageDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              'Choose An Option',
              style: textRegular14.copyWith(color: Colors.black, fontSize: 16),
            ),
            content: SizedBox(
                width: double.maxFinite,
                height: Dimensions.screenWidth / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        controller.accessImage(ImageSource.camera);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Camera',
                          style: textRegular14.copyWith(color: Colors.black),
                        ).paddingAll(8),
                      ),
                    ),
                    const Divider(
                      color: primaryLight,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Get.back();
                        controller.accessImage(ImageSource.gallery);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Gallery',
                          style: textRegular14.copyWith(color: Colors.black),
                        ).paddingAll(8),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
