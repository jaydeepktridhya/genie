import 'package:flutter/material.dart';
import 'package:genie/utils/ui_utils.dart';
import 'package:get/get.dart';

import '../../style/dimensions.dart';
import '../../style/text_styles.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_container.dart';
import 'how_to_use_controller.dart';

class HowToUseView extends GetView<HowToUseController> {
  const HowToUseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[blueBC, blueBD],
    ).createShader(const Rect.fromLTWH(48.0, 467.0, 279.0, 24.0));
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
        backgroundColor: Colors.transparent,
        leading: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
          ),
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'If you can dream it,',
            style: textRegular20.copyWith(fontWeight: FontWeight.w400),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Genie ',
                style: textRegular20.copyWith(
                    fontWeight: FontWeight.w400,
                    foreground: Paint()..shader = linearGradient),
              ),
              Text(
                'can write it.',
                style: textRegular20.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          24.verticalSpace,
          CustomContainer(
            progress: 0.12,
            size: Dimensions.screenWidth,
            childGradient: const Text(
              'Dating Apps',
              style: textRegular,
            ).paddingOnly(top: 10, bottom: 10, left: 18),
            child: Text(
              'Write a quirky 2 sentence icebreaker for my Hinge match, she like Boba & Anime.',
              style: textRegular14.copyWith(fontWeight: FontWeight.w400),
            ).paddingOnly(top: 14, bottom: 14, left: 18, right: 18),
          ),
          20.verticalSpace,
          CustomContainer(
            progress: 0.12,
            size: Dimensions.screenWidth,
            childGradient: const Text(
              'Dating Apps',
              style: textRegular,
            ).paddingOnly(top: 10, bottom: 10, left: 18),
            child: Text(
              'Write a quirky 2 sentence icebreaker for my Hinge match, she like Boba & Anime.',
              style: textRegular14.copyWith(fontWeight: FontWeight.w400),
            ).paddingOnly(top: 14, bottom: 14, left: 18, right: 18),
          ),
          20.verticalSpace,
          CustomContainer(
            progress: 0.12,
            size: Dimensions.screenWidth,
            childGradient: const Text(
              'Dating Apps',
              style: textRegular,
            ).paddingOnly(top: 10, bottom: 10, left: 18),
            child: Text(
              'Write a quirky 2 sentence icebreaker for my Hinge match, she like Boba & Anime.',
              style: textRegular14.copyWith(fontWeight: FontWeight.w400),
            ).paddingOnly(top: 14, bottom: 14, left: 18, right: 18),
          ),
          20.verticalSpace,
          CustomContainer(
            progress: 0.12,
            size: Dimensions.screenWidth,
            childGradient: const Text(
              'Dating Apps',
              style: textRegular,
            ).paddingOnly(top: 10, bottom: 10, left: 18),
            child: Text(
              'Write a quirky 2 sentence icebreaker for my Hinge match, she like Boba & Anime.',
              style: textRegular14.copyWith(fontWeight: FontWeight.w400),
            ).paddingOnly(top: 14, bottom: 14, left: 18, right: 18),
          ),
        ],
          ).paddingOnly(top: 16, left: 24, right: 24),
        ));
  }
}
