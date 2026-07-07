import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/questionSelectionCheckBoxClicked.dart';
import 'package:teach_advance/utility/containerPro.dart';
import 'package:teach_advance/utility/previous_of_widget.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';

import '../apis/checkEditorAccessPermissionAPI.dart';
import '../functions/check_questions_available_in_list.dart';
import '../functions/getRecordIdOfSelectedQuestionInAPraticularSet.dart';
import '../screens/editor.dart';

Widget listMode(itemScrollController, itemPositionsListener) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  bool check = false;
  return Expanded(
    child: ScrollablePositionedList.builder(
      itemCount: manageShowingContent.questionListForSelection.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          manageShowingContent.questionListVisibleIndex.value = index;
          manageShowingContent.questionViewMode.value = 1;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Obx(
                            () => Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GFCheckbox(
                                      size: 25,
                                      activeBgColor: GFColors.SUCCESS,
                                      onChanged: (value) {
                                        questionSelectCheckBoxClickedOne(index);
                                      },
                                      value: questionSelectoNECheckBoxClicked(
                                          index),
                                    ),
                                    containerPro(
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Question No. ${index + 1} ",
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Colors.yellow,
                                        Colors.transparent,
                                        4.0,
                                        4.0),
                                    InkWell(
                                      onTap: () async {
                                        EasyLoading.show(dismissOnTap: true);
                                        var editingAccess =
                                            await checkEditorAccessAPI();
                                        if (editingAccess) {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) =>const TextEditor(),
                                          );
                                          // modalForChooseLanguageForEditing();
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.edit),
                                      ),
                                    )
                                  ],
                                ),
                                questionWidget(manageShowingContent
                                        .questionListForSelection[index][
                                    manageShowingContent.language.value == "hin"
                                        ? "question_hin"
                                        : "question_eng"]),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              previousOfWidget(
                                  manageShowingContent.questionListForSelection[
                                          manageShowingContent
                                              .questionListVisibleIndex
                                              .value]['previous_of'] ??
                                      ""),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.blueGrey.shade100,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
    ),
  );
}
