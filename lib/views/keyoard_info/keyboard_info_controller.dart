import 'package:flutter/material.dart';
import 'package:genie/views/settings/settings_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

import '../../controller/base_controller.dart';

class KeyboardInfoController extends BaseController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxBool isKeyboardEnabled = Get.find<SettingsController>().isKeyboardEnabled;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabController?.addListener(() {
      update();
    });
    super.onInit();
  }
}
