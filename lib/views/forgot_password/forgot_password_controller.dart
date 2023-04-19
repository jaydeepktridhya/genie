import 'package:flutter/cupertino.dart';
import 'package:genie/controller/base_controller.dart';
import 'package:genie/model/general_model.dart';
import 'package:genie/routes/app_pages.dart';
import 'package:genie/services/index.dart';
import 'package:get/get.dart';
import '../../utils/utility.dart';
import '../../utils/validations.dart';

class ForgotPasswordController extends BaseController {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  final Services _services = Services();

  bool validate() {
    if (emailCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyEmail, Get.context!);
      return false;
    }
    return true;
  }

  void forgotPasswordApi(
    String email,
  ) async {
    Utility().showProgressBarDialog();
    GeneralModel? resData = await _services.api!.forgetPassword(
        email: email,
        onNoInternet: () {
          Utility.snackBar('No internet connected!', Get.context!);
        });
    Utility().hideProgressBarDialog();
    if (resData != null) {
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
      Utility.snackBar(resData.message ?? "", Get.context!);
    } else {
      Utility.snackBar("Something went wrong", Get.context!);
    }
  }
}
