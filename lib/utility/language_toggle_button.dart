import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/containerPro.dart';

Widget langaugeToggleWidget() {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return GestureDetector(
    onTap: () {
      if (manageShowingContent.language.value == "eng") {
        manageShowingContent.language.value = "hin";
      } else if (manageShowingContent.language.value == "hin") {
        manageShowingContent.language.value = "eng";
      }
    },
    child: containerPro(
        Obx(() => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
              child: Text(
                manageShowingContent.language.value == "hin"
                    ? "Hindi"
                    : "English",
                style: const TextStyle(
                  fontFamily: "serif",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
            )),
        Colors.white,
        Colors.white,
        6.0,
        100.0),
  );
}
