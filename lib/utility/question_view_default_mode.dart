import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';

Widget questionViewDefaultMode() {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return Flexible(
    child: Column(
      children: [
        questionAndOptionAndSolution(
            manageShowingContent.questionListForSelection),
        bottomAction(),
      ],
    ),
  );
}
