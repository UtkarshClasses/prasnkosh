import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

maintenanceMode() {
  return Get.defaultDialog(
    barrierDismissible: false,
    content: Image.asset(
      'assets/images/under_maintenance.png',
      height: 160,
    ),
    title: "",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: colors.leftGradient,
  );
}
