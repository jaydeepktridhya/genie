import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class GetCustomPermission {
  bool granted = false;

  late Permission _permission;
  final String subHeading;

  GetCustomPermission.gallery(
      {this.subHeading = "Photos permission is needed."}) {
    if (Platform.isIOS) {
      _permission = Permission.photos;
    } else {
      _permission = Permission.storage;
    }
  }

  GetCustomPermission.camera(
      {this.subHeading = "Camera permission is needed."}) {
    _permission = Permission.camera;
  }

  Future<void> getPermission(context) async {
    PermissionStatus permissionStatus = await _permission.status;

    try {
      if (permissionStatus == PermissionStatus.restricted) {
        print("Restricted");
        _showOpenAppSettingsDialog(context, subHeading);

        permissionStatus = await _permission.status;

        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }

      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        print("permanentlyDenied");
        _showOpenAppSettingsDialog(context, subHeading);

        permissionStatus = await _permission.status;

        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }

      if (permissionStatus == PermissionStatus.limited) {
        print("limited");
        permissionStatus = await _permission.request();

        if (permissionStatus != PermissionStatus.granted) {
          //Only continue if permission granted
          return;
        }
      }

      if (permissionStatus == PermissionStatus.denied) {
        print("denied");
        // if (Platform.isIOS) {
        //   _showOpenAppSettingsDialog(context, subHeading);
        // } else {
        print("Request");
        permissionStatus = await _permission.request();
        if (permissionStatus == PermissionStatus.permanentlyDenied) {
          _showOpenAppSettingsDialog(context, subHeading);
        }
        // }

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
          openAppSettings();
          Navigator.pop(context);
        },
        negativeButtonText: "Cancel",
        onPressedNegative: () {
          Navigator.pop(context);
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
    if (Platform.isIOS) {
      // iOS-specific code
      showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (_) => CupertinoAlertDialog(
          title: _buildTitle(context, heading),
          content: _buildSubTitle(context, subHeading),
          actions: _buildActions(
            context,
            positiveButtonText,
            onPressedPositive,
            negativeButtonText,
            onPressedNegative,
            showNegativeButton,
            isPositiveButtonDangerous,
          ),
        ),
      );
    } else {
      showDialog(
        useRootNavigator: false,
        context: context,
        builder: (_) => AlertDialog(
          title: _buildTitle(context, heading),
          content: _buildSubTitle(context, subHeading),
          actions: _buildActions(
            context,
            positiveButtonText,
            onPressedPositive,
            negativeButtonText,
            onPressedNegative,
            showNegativeButton,
            isPositiveButtonDangerous,
          ),
        ),
      );
    }
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
                color: isPositiveButtonDangerous ? Colors.black : Colors.red),
          ),
        ),
      // FlatButton(
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   onPressed: () {
      //     if (onPressedNegative != null) {
      //       onPressedNegative();
      //     } else {
      //       Navigator.pop(context);
      //     }
      //   },
      //   child: Text(
      //     negativeButtonText ?? 'Cancel',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //         color: isPositiveButtonDangerous ? Colors.black : Colors.red),
      //   ),
      // ),
      ElevatedButton(
        onPressed: () {
          if (onPressedPositive != null) onPressedPositive();
        },
        child: Text(
          positiveButtonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isPositiveButtonDangerous ? Colors.red : Colors.black,
          ),
        ),
      )
      // FlatButton(
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   onPressed: () {
      //     if (onPressedPositive != null) onPressedPositive();
      //   },
      //   child: Text(
      //     positiveButtonText,
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: isPositiveButtonDangerous ? Colors.red : Colors.black,
      //     ),
      //   ),
      // ),
    ];
  }
}
