import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:genie/database/app_preferences.dart';
import 'package:genie/model/login_master.dart';
import 'package:genie/services/index.dart';
import 'package:genie/utils/app_constants.dart';
import 'package:genie/utils/custom_permission.dart';
import 'package:genie/views/login/login_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/base_controller.dart';
import '../../model/general_model.dart';
import '../../services/api_params.dart';
import '../../utils/utility.dart';
import '../../utils/validations.dart';
import 'package:get/get.dart';

class EditProfileController extends BaseController {
  TextEditingController nameCtl = TextEditingController();
  FocusNode nameFn = FocusNode();
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  final Services _services = Services();
  LoginDetails? details = LoginDetails();
  File? pickedImageFile;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    details = (await AppPreferences().getLoginDetails())!;
  }

  bool validate() {
    if (nameCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyName, Get.context!);
      return false;
    }
    if (emailCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyEmail, Get.context!);
      return false;
    }
    return true;
  }

  void updateProfileApi(String name, String? imagePath) async {
    Utility().showProgressBarDialog();
    Map<String, String> getParams() {
      var map = <String, String>{};
      map[ApiParams.firstName] = name;
      map[ApiParams.userId] = details!.userId.toString();
      map[ApiParams.email] = details!.emailId.toString();
      printf("Parameter: ${json.encode(map)}");
      return map;
    }

    GeneralModel? resData = await _services.api!.updateProfile(
        params: getParams(),
        imagePath: imagePath ?? "",
        onSuccess: (data) {
          Utility().hideProgressBarDialog();
          if (data != null) {
            Utility.snackBar(data.message.toString(), Get.context!);
            Get.back(result: {"changedProfile": "true"});
          } else {
            Utility.snackBar("Something went wrong", Get.context!);
          }
        },
        onFail: () {
          Utility.snackBar("Something went wrong", Get.context!);
        },
        onNoInternet: () {
          Utility().hideProgressBarDialog();
          Utility.snackBar('No internet connected!', Get.context!);
        });
  }

  accessImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: imageSource);
    if(pickedImage!=null){
      pickedImageFile = File(pickedImage.path);
      update();
    }
  }
}
