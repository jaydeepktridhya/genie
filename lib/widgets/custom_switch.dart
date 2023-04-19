library custom_switch;

import 'package:flutter/material.dart';
import 'package:genie/utils/colors.dart';

class CustomSwitch extends StatefulWidget {
  bool? value;
  ValueChanged<bool>? onChanged;

  CustomSwitch({
    Key? key,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value! ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value! ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged!(true)
                : widget.onChanged!(false);
          },
          child: Container(
            width: 36.0,
            height: 21.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              gradient: _circleAnimation!.value == Alignment.centerRight
                  ? const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [blueBC, blueBD],
                    )
                  : const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.grey, Colors.grey],
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Align(
                alignment: _circleAnimation!.value,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, color: white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
