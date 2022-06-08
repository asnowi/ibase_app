import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void show(Widget widget) {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      widget,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
      barrierDismissible: false,
    );
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}