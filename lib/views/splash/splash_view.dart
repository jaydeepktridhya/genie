import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/views/splash/splash_controller.dart';
import 'package:get/get.dart';

import '../../style/dimensions.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primary4D,
                primary81,
              ],
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SizedBox(
                  height: Dimensions.screenHeight / 2.6,
                  child: Image.asset(
                    ImagePath.appLogoLogin,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
