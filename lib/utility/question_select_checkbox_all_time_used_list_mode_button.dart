import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/containerPro.dart';
import 'package:teach_advance/utility/icons.dart';

import '../functions/check_questions_available_in_list.dart';
import '../functions/getRecordIdOfSelectedQuestionInAPraticularSet.dart';
import '../functions/questionSelectionCheckBoxClicked.dart';

Widget selectCheckBoxAndTimesUsedAndListButton(scrollToXIndex) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return Row(
    children: [
      GestureDetector(
          onTap: () {
            manageShowingContent.questionViewMode.value = 0;

            if (manageShowingContent.questionListForSelection
                    .toString()
                    .contains(r'$') ||
                manageShowingContent.questionListForSelection
                    .toString()
                    .contains(r'\(')) {
              EasyLoading.showToast(
                  "Question containing equation is not clickable",
                  toastPosition: EasyLoadingToastPosition.top,
                  duration: const Duration(seconds: 1),
                  dismissOnTap: true,
                  maskType: EasyLoadingMaskType.black);
            }

            Timer(const Duration(milliseconds: 300), () {
              // ye delay esliye lagayen hain taaki list proper render ho jaye fir scrolltoIndex function call ho nahi to error aa jaata hai
              scrollToXIndex(
                  manageShowingContent.questionListVisibleIndex.value);
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: getIconWidget(Icons.list_alt_outlined, Colors.white, 36.0),
          )),
      Obx(
        () => GFCheckbox(
          size: 25,
          activeBgColor: GFColors.SUCCESS,
          onChanged: (value) async {
            questionSelectCheckBoxClicked();
          },
          value: checkAvailableInList(
              getRecordIdOfSelectedQuestionInAPraticularSet(),
              manageShowingContent.questionListForSelection[manageShowingContent
                  .questionListVisibleIndex.value]['record_id']),
        ),
      ),
      Obx(
        () => (manageShowingContent.usedQuestions['record_id_list'].value
                .contains(manageShowingContent.questionListForSelection[
                        manageShowingContent.questionListVisibleIndex.value]
                    ['record_id']))
            ? containerPro(
                Text(
                  "Used ${manageShowingContent.usedQuestions['record_id_list'].where((e) => e == manageShowingContent.questionListForSelection[manageShowingContent.questionListVisibleIndex.value]['record_id']).length} times",
                  style: const TextStyle(
                      fontFamily: "serif",
                      fontSize: 9.0,
                      fontStyle: FontStyle.italic),
                ),
                Colors.yellow,
                Colors.white,
                4.0,
                10.0)
            : Container(),
      ),
    ],
  );
}
