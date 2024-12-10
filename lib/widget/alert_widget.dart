import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme/app_theme.dart';

void notificationAlert(String message) {
  Get.rawSnackbar(
    padding: const EdgeInsets.only(
      left: 28,
      top: 12,
      bottom: 10,
    ),
    messageText: Text(
      message,
      style: AppTextStyle.regular16(color: Colors.white),
    ),
    isDismissible: false,
    duration: const Duration(seconds: 3),
    backgroundColor: AppColors.redColor,
    icon: Container(
      alignment: Alignment.topRight,
      height: 18,
      width: 68,
      child: const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
        size: 18,
      ),
    ),
    margin: EdgeInsets.zero,
    snackStyle: SnackStyle.GROUNDED,
  );
}
