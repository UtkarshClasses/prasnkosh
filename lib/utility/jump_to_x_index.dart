import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/PaddingWidget.dart';
import 'package:teach_advance/utility/circularBox.dart';

showJumpingPositions(thisQuestion) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  Get.defaultDialog(
    title: "Select Index",
    content: SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: [
            for (int i = 0;
                i < manageShowingContent.questionListForSelection.length;
                i++) ...[
              GestureDetector(
                onTap: () {
                  manageShowingContent.questionListForSelection
                      .remove(thisQuestion);
                  manageShowingContent.questionListForSelection
                      .insert(i, thisQuestion);
                  manageShowingContent.questionListVisibleIndex.value = i;
                  manageShowingContent.selectedQuestions.value =
                      manageShowingContent.questionListForSelection;
                  Get.back();
                  EasyLoading.showToast("Question index changed",
                      maskType: EasyLoadingMaskType.black,
                      duration: const Duration(milliseconds: 200));
                },
                child: paddingOnly(
                  2.0,
                  2.0,
                  2.0,
                  2.0,
                  circularBox(
                      30.0,
                      30.0,
                      (i + 1).toString(),
                      (manageShowingContent.questionListVisibleIndex.value == i)
                          ? Colors.amber
                          : Colors.amber.shade100,
                      Colors.black),
                ),
              )
            ]
          ],
        ),
      ),
    ),
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "serif",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: Colors.red,
  );
}
