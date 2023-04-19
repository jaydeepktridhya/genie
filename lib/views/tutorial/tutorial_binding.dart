import 'package:genie/views/splash/splash_controller.dart';
import 'package:genie/views/tutorial/tutorial_controller.dart';
import 'package:get/get.dart';

class TutorialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorialController>(
      () => TutorialController(),
    );
  }
}
