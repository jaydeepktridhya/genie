import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genie/style/text_styles.dart';
import 'package:genie/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../utils/colors.dart';
import '../model/theme_model.dart';
import '../style/dimensions.dart';
import 'image_paths.dart';

extension VerticalSpace on num {
  Widget get verticalSpace {
    return SizedBox(height: toDouble());
  }
}

extension HorizontalSpace on num {
  Widget get horizontalSpace {
    return SizedBox(width: toDouble());
  }
}

class UiUtils {
  Widget gapWidget({double? height = 0, double? width = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget customTextField({
    TextEditingController? controller,
    FocusNode? focusNode,
    String? text,
    String? hintText,
    bool? obscureText,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    bool? readOnly,
    TextStyle? style,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? "",
          style: textRegular,
        ),
        10.verticalSpace,
        TextField(
          textInputAction: textInputAction,
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          style: style ?? textRegularLight,
          cursorColor: white,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 25, minWidth: 25),
              prefixIcon: prefixIcon,
              contentPadding: contentPadding,
              hintText: hintText,
              hintStyle: textRegularLight,
              filled: true,
              fillColor: white.withOpacity(0.1)),
        ),
      ],
    );
  }

  Widget loadingWidget() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(blue11),
    );
  }

  Widget appButton(
      {required VoidCallback? onPressFunction,
      String? buttonText,
      Color? buttonFillColor,
      Color? buttonBorderColor,
      Color? buttonTextColor}) {
    return InkWell(
      onTap: () {
        onPressFunction != null ? onPressFunction() : null;
      },
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Container(
        height: 52,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonFillColor, borderRadius: BorderRadius.circular(28)),
        child: Center(
            child: Text(
          buttonText ?? "N/A",
          style: textRegular,
        )),
      ),
    );
  }

  Container roundButtonWithIcon(
      String text, TextStyle textStyle, String iconPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(48)),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6, left: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(child: SvgPicture.asset(iconPath)),
            Expanded(child: Container()),
            Text(
              text,
              style: textStyle,
              textScaleFactor: 1.0,
            ),
            Expanded(child: Container()),
            Flexible(child: Container(width: 24)),
          ],
        ),
      ),
    );
  }

  EdgeInsets setDiffPadding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  EdgeInsets setAllPadding(double value) {
    return EdgeInsets.all(value);
  }

  Widget appTextButton(
      {required VoidCallback onPressFunction,
      String? buttonText,
      Color? buttonTextColor,
      bool? isLinkText = false}) {
    return TextButton(
        onPressed: () {
          onPressFunction();
        },
        child: Text(buttonText ?? "N/A",
            style: TextStyle(
                color: buttonTextColor,
                fontSize: Dimensions.screenWidth / 22,
                letterSpacing: 0.25,
                fontWeight: FontWeight.w500,
                decoration: isLinkText == false
                    ? TextDecoration.none
                    : TextDecoration.underline)));
  }

  showLogMessage({
    required var className,
    required String functionName,
    required String message,
  }) {
    if (message.isNotEmpty && kDebugMode) {
      return debugPrint(
          "className : $className , functionName: $functionName , message :$message");
    }
  }

  Widget dividerWidget() {
    return const Divider(
      color: black44,
      thickness: 1.0,
    );
  }

  Widget customContainer(String icon, Color iconColor, String text,
      String arrowIcon, VoidCallback onTap, bool isVisible, Color color) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: white.withOpacity(0.1),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 24,
                    width: 24,
                    color: iconColor,
                  ),
                  14.horizontalSpace,
                  Text(text,
                      style: textRegularLight.copyWith(
                          fontSize: Dimensions.fontSizeDefault, color: color)),
                ],
              ),
              Visibility(
                visible: isVisible,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDynamicContainer(
      String icon, String text, VoidCallback onTap, bool isTrue) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: white.withOpacity(0.1),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 24,
                    width: 24,
                    color: isTrue ? green71 : red6D,
                  ),
                  14.horizontalSpace,
                  text == AppConstants.fullAccessDisabled
                      ? Text(
                          isTrue
                              ? AppConstants.fullAccessEnabled
                              : AppConstants.fullAccessDisabled,
                          style: textRegularLight.copyWith(
                              fontSize: Dimensions.fontSizeDefault,
                              color: isTrue ? green71 : red6D))
                      : Text(
                          isTrue
                              ? AppConstants.keyboardEnabled
                              : AppConstants.keyboardDisable,
                          style: textRegularLight.copyWith(
                              fontSize: Dimensions.fontSizeDefault,
                              color: isTrue ? green71 : red6D)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gradientContainer(String icon, String text, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 3,
          width: 71,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [blueBC, blueBD],
          )),
        ),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            width: Dimensions.screenWidth / 4.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: RadialGradient(
                center: Alignment.bottomCenter,
                colors: [
                  blueBC.withOpacity(0.4),
                  blueBD.withOpacity(0.1),
                ],
              ),
            ),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 13, bottom: 12, right: 13),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      icon,
                    ),
                    13.verticalSpace,
                    Text(text,
                        textAlign: TextAlign.center,
                        style: textRegularLight.copyWith(
                          fontSize: Dimensions.fontSize11,
                        )).marginSymmetric(horizontal: 3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget roundedButton(
    String buttonName,
    VoidCallback? onTap,
  ) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [blueBC, blueBD],
            ),
            borderRadius: BorderRadius.all(Radius.circular(48))),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Text(buttonName, style: textRegular),
        )),
      ),
    );
  }

  Widget purchaseListview(
    VoidCallback? onTapContainer,
    String offerText,
    String title,
    String text,
    int index,
    int selectedValueIndex,
    VoidCallback? onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: onTapContainer,
        child: Stack(
          children: [
            Visibility(
              visible: index == selectedValueIndex,
              child: index == selectedValueIndex
                  ? Positioned(
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [blueBC, blueBD],
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 4, bottom: 4),
                          child: Text(offerText, style: textRegular12),
                        ),
                      ),
                    )
                  : Container(),
            ),
            Container(
              decoration: BoxDecoration(
                border: index == selectedValueIndex
                    ? const GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [blueBC, blueBD],
                        ),
                        width: 1,
                      )
                    : const GradientBoxBorder(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.transparent, Colors.transparent],
                        ),
                        width: 0,
                      ),
                borderRadius: BorderRadius.circular(8),
                color: white.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 21.0, right: 24, top: 21, bottom: 21),
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: onTap,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: blueED),
                              color: index == selectedValueIndex
                                  ? blueED
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          height: 21,
                          width: 21,
                          child: Visibility(
                            visible: index == selectedValueIndex,
                            child: const Icon(
                              Icons.check,
                              size: 20,
                              color: blue76,
                            ),
                          )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: textRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall)),
                      7.verticalSpace,
                      Text(text, style: textRegular),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget staticLabel(String text) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [blueBC, blueBD],
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Text(text, style: textRegular),
      )),
    );
  }

  Widget roundedGradientButton(
      String buttonName,
      VoidCallback? onTap,
      ) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [blueBC, blueBD],
            ),
            borderRadius: BorderRadius.all(Radius.circular(48))),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(buttonName, style: textRegular),
            )),
      ),
    );
  }

}
