import 'package:genie/views/dashboard/dashboard_controller.dart';
import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:get/get.dart';

import 'how_to_use_controller.dart';

class HowToUseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowToUseController>(
      () => HowToUseController(),
    );
  }
}
