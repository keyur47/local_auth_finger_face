import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController getSnackBar(title, subtitle) {
  return Get.snackbar(
    title,
    subtitle,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red.shade400,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 2),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
