import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../style/dimensions.dart';
import '../utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color progressColor;
  final double progress;
  final double size;
  final Widget child;
  final Widget childGradient;

  const CustomContainer({
    Key? key,
    this.backgroundColor = white,
    this.progressColor = red3D,
    required this.progress,
    required this.size,
    required this.child,
    required this.childGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [blueBC, blueBD],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),

              ),
              border: GradientBoxBorder(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [blueBC, blueBD],
              )),
            ),

            child: childGradient,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              border: GradientBoxBorder(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [blueBC, blueBD],
              )),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
