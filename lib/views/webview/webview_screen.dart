import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genie/style/text_styles.dart';
import 'package:genie/utils/colors.dart';
import 'package:genie/utils/image_paths.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../style/dimensions.dart';
import '../../utils/app_constants.dart';
import 'webview_custom_controller.dart';

class WebViewScreen extends StatelessWidget {
  final WebViewCustomController controller = Get.put(
    WebViewCustomController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
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
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              InkWell(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(ImagePath.icBack))
                  .paddingOnly(left: 18,top: 4,bottom:4,right:4),
              Text(
                controller.title.value,
                style:
                    textRegularLight.copyWith(fontSize: Dimensions.fontSize18),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearProgressIndicator(
                backgroundColor: primary81,
                valueColor: const AlwaysStoppedAnimation(primary4D),
                minHeight: 4,
                value: controller.progressValue.value,
              ),
              Expanded(
                child: WebViewWidget(
                  controller: controller.webViewController,
                ).paddingOnly(top: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
