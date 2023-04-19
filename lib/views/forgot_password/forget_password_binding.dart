import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:get/get.dart';

import 'forgot_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}
