import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie/style/text_styles.dart';
import 'package:genie/utils/colors.dart';
import 'package:genie/utils/utility.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class GetCustomPermission {
  bool granted = false;

  late Permission _permission;
  final String subHeading;

  GetCustomPermission.gallery(
      {this.subHeading = "Photos permission is needed."}) {
    _permission = Permission.photos;
  }

  GetCustomPermission.camera(
      {this.subHeading = "Camera permission is needed."}) {
    _permission = Permission.camera;
  }

  GetCustomPermission.notification(
      {this.subHeading = "Notification permission is needed."}) {
    _permission = Permission.notification;
  }

  Future<void> getPermission(context) async {
    PermissionStatus permissionStatus = await _permission.status;

    try {
      if (permissionStatus == PermissionStatus.restricted) {
        printf("Restricted");
        _showOpenAppSettingsDialog(context, subHeading);

        permissionStatus = await _permission.status;

        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }
      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        printf("permanentlyDenied");
        _showOpenAppSettingsDialog(context, subHeading);

        permissionStatus = await _permission.status;

        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }

      if (permissionStatus == PermissionStatus.limited) {
        printf("limited");
        permissionStatus = await _permission.request();

        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }

      if (permissionStatus == PermissionStatus.denied) {
        printf("Request");
        permissionStatus = await _permission.request();
        if (permissionStatus == PermissionStatus.permanentlyDenied) {
          _showOpenAppSettingsDialog(context, subHeading);
        }
        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }

      if (permissionStatus == PermissionStatus.granted) {
        granted = true;
        return;
      }
    } on Exception catch (e) {
      print("error: ${e.toString()}");
      return;
    }
  }

  _showOpenAppSettingsDialog(context, String subHeading) {
    return CustomDialog.show(
        context,
        'Permission needed',
        subHeading,
        'Open settings',
        () {
          if (Get.isDialogOpen!) {
            navigator?.popUntil((route) {
              return (!Get.isDialogOpen!);
            });
          }
          openAppSettings();
        },
        negativeButtonText: "Cancel",
        onPressedNegative: () {
          if (Get.isDialogOpen!) {
            navigator?.popUntil((route) {
              return (!Get.isDialogOpen!);
            });
          }
        });
  }
}

class CustomDialog {
  static void show(
    context,
    String heading,
    String subHeading,
    String positiveButtonText,
    Function onPressedPositive, {
    required String negativeButtonText,
    required Function onPressedNegative,
    bool showNegativeButton = true,
    bool isPositiveButtonDangerous = false,
  }) {
    Get.dialog(AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(heading.toString(), style: textRegular14),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                onPressedNegative();
              },
              child: Container(
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primary81),
                    borderRadius: BorderRadius.circular(25)),
                // Make rounded corner
                child: Text(negativeButtonText,
                        style: textRegular14.copyWith(color: Colors.white),
                        textScaleFactor: 1.0)
                    .paddingSymmetric(horizontal: 4),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                onPressedPositive();
              },
              child: Container(
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primary81, borderRadius: BorderRadius.circular(25)),
                // Make rounded corner
                child: Text(
                  positiveButtonText,
                  style: textRegular14.copyWith(color: Colors.white),
                  textScaleFactor: 1.0,
                ).paddingSymmetric(horizontal: 4),
              ),
            )),
          ],
        ),
      ],
    )));
  }

  static _buildTitle(context, String heading) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(heading, style: TextStyle(fontSize: 18)),
    );
  }

  static _buildSubTitle(context, String subHeading) {
    if (subHeading != null && subHeading.isNotEmpty) {
      return Text(
        subHeading,
        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      );
    }
    return SizedBox.shrink();
  }

  static List<Widget> _buildActions(
      context,
      String positiveButtonText,
      Function onPressedPositive,
      String negativeButtonText,
      Function onPressedNegative,
      bool showNegativeButton,
      bool isPositiveButtonDangerous) {
    return [
      if (showNegativeButton)
        ElevatedButton(
          onPressed: () {
            if (onPressedNegative != null) {
              onPressedNegative();
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            negativeButtonText ?? 'Cancel',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isPositiveButtonDangerous ? Colors.white : Colors.red),
          ),
        ),
      ElevatedButton(
        onPressed: () {
          if (onPressedPositive != null) onPressedPositive();
        },
        child: Text(
          positiveButtonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isPositiveButtonDangerous ? Colors.red : Colors.white,
          ),
        ),
      ),
    ];
  }
}
