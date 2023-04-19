import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/register/register_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
