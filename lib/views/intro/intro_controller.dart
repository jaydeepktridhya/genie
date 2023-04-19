import 'package:flutter/services.dart';
import 'package:genie/utils/utility.dart';

import '../../controller/base_controller.dart';

class IntroController extends BaseController {
  static const methodChannel = MethodChannel('genie.methodChannel');
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> openIOSSettings() async {
    try {
      final dynamic result = await methodChannel.invokeMethod('openSettings');
      printf("============= $result");
    } catch (e) {
      printf("Can't fetch the method: '$e'.");
    }
  }
}
