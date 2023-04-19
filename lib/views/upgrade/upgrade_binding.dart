import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:genie/views/upgrade/upgrade_controller.dart';
import 'package:get/get.dart';

class UpgradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradeController>(
      () => UpgradeController(),
    );
  }
}
