import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/profile/edit_profile_controller.dart';
import 'package:genie/views/profile/profile_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
