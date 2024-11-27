import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static showCustomSuccessSnackBar(
      {required String title,
      required String message,
      Duration? duration,
      Icon? icon}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(milliseconds: 1500),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: icon ?? Icon(Icons.info_outline),
    );
  }

  static showCustomErrorSnackBar(
      {required String title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(milliseconds: 1500),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      colorText: Colors.white,
      backgroundColor: color ?? Colors.redAccent,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  static showCustomToast(
      {String? title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(milliseconds: 1500),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.green,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }

  static showCustomErrorToast(
      {String? title,
      required String message,
      Color? color,
      Icon? icon,
      Icon? mainButton,
      Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },

      icon: icon ?? Icon(Icons.info_outline),
      mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: mainButton ??
              Icon(
                Icons.close,
                color: Colors.black,
              )),
      // overlayBlur: 0.8,
      message: message,
    );
  }
}
