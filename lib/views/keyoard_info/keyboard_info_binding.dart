import 'package:genie/views/keyoard_info/keyboard_info_controller.dart';
import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:get/get.dart';

class KeyboardInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeyboardInfoController>(
      () => KeyboardInfoController(),
    );
  }
}
