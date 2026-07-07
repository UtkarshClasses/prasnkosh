import 'package:get/get.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/manage_showing_content.dart';

final ManageShowingContent manageShowingContentController =
    Get.put(ManageShowingContent());

Widget settingsTransferSetDeleteButton(isShowSetting) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        !isShowSetting
            ? buttonWidgets("Settings", Icons.settings, "settings")
            : Container(),
        questaiolevelButton()
      ],
    ),
  );
}

Widget questaiolevelButton() {
  int easyPreSelectedCount = manageShowingContentController
      .selectedQuestions.value
      .filter((element) => element['type'] == 'low')
      .length;
  int mediumPreSelectedCount = manageShowingContentController
      .selectedQuestions.value
      .filter((element) => element['type'] == 'medium')
      .length;
  int hardPreSelectedCount = manageShowingContentController
      .selectedQuestions.value
      .filter((element) => element['type'] == 'high')
      .length;

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Obx(() {
      int easyCount = manageShowingContentController
          .questionListForSelection.value
          .filter((element) => element['type'] == 'low')
          .length;
      int easySelectedCount = manageShowingContentController
          .selectedQuestions.value
          .filter((element) => element['type'] == 'low')
          .length;
      int mediumCount = manageShowingContentController
          .questionListForSelection.value
          .filter((element) => element['type'] == 'medium')
          .length;
      int mediumSelectedCount = manageShowingContentController
          .selectedQuestions.value
          .filter((element) => element['type'] == 'medium')
          .length;
      int hardCount = manageShowingContentController
          .questionListForSelection.value
          .filter((element) => element['type'] == 'high')
          .length;
      int hardSelectedCount = manageShowingContentController
          .selectedQuestions.value
          .filter((element) => element['type'] == 'high')
          .length;
      return Row(
        children: [
          queLeaveWidgets("All", "all"),
          easyCount == 0
              ? Container()
              : queLeaveWidgets("$easySelectedCount Low", "low"),
          mediumCount == 0
              ? Container()
              : queLeaveWidgets("$mediumSelectedCount Medium", "medium"),
          hardCount == 0
              ? Container()
              : queLeaveWidgets("$hardSelectedCount High", "high"),
        ],
      );
    }),
  );
}
