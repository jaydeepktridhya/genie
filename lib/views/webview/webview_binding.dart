import 'package:genie/views/keyoard_info/keyboard_info_controller.dart';
import 'package:genie/views/login/login_controller.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:genie/views/webview/webview_custom_controller.dart';
import 'package:get/get.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewCustomController>(
      () => WebViewCustomController(),
    );
  }
}
