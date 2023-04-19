import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/base_controller.dart';
import '../settings/settings_controller.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  var blurValue = 0.0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabController?.addListener(() {
      update();
    });
    super.onInit();
  }
}
