import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/apis/checkEditorAccessPermissionAPI.dart';
import 'package:teach_advance/apis/deleteSetAPI.dart';
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/apis/getSetConfigurationAPI.dart';
import 'package:teach_advance/apis/saveSelectedQuestionsAPI.dart';
import 'package:teach_advance/controllers/home_screen_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/filterButtonClick.dart';
import 'package:teach_advance/functions/nextPreviousButtonClickWhileViewingQuestions.dart';
import 'package:teach_advance/functions/shuffleQuestion.dart';
import 'package:teach_advance/functions/transfer_set_on_click.dart';
import 'package:teach_advance/screens/editor.dart';
import 'package:teach_advance/screens/entry_screen.dart';
import 'package:teach_advance/utility/PaddingWidget.dart';
import 'package:teach_advance/utility/app_bar_custom.dart';
import 'package:teach_advance/utility/circularBox.dart';
import 'package:teach_advance/utility/containerPro.dart';
import 'package:teach_advance/utility/copySet.dart';
import 'package:teach_advance/utility/helper_functions.dart';
import 'package:teach_advance/utility/icons.dart';
import 'package:teach_advance/utility/jump_to_x_index.dart';
import 'package:teach_advance/utility/optionBox.dart';
import 'package:teach_advance/utility/previous_of_widget.dart';
import 'package:teach_advance/utility/question_select_checkbox_all_time_used_list_mode_button.dart';
import 'package:teach_advance/utility/report_error_modal.dart';
import 'package:teach_advance/utility/select_all_question_button.dart';
import 'package:teach_advance/utility/set_setting_modal.dart';
import 'language_toggle_button.dart';
import 'solutionBoxWidget.dart';

Widget questionAndOptionAndSolution(questionsList) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: InteractiveViewer(
              maxScale: 4.0,
              child: Column(
                children: [
                  paddingOnly(
                    4.0,
                    8.0,
                    4.0,
                    8.0,
                    GestureDetector(
                      onDoubleTap: () async {
                        EasyLoading.show(dismissOnTap: true);
                        var editingAccess = await checkEditorAccessAPI();
                        if (editingAccess) {
                          modalForChooseLanguageForEditing();
                        }
                      },
                      child: Column(
                        children: [
                          Obx(
                            () => Column(
                              children: [
                                questionWidget(questionsList[
                                        manageShowingContent
                                            .questionListVisibleIndex.value][
                                    manageShowingContent.language.value == "hin"
                                        ? "question_hin"
                                        : "question_eng"]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    previousOfWidget(questionsList[
                                            manageShowingContent
                                                .questionListVisibleIndex
                                                .value]['previous_of'] ??
                                        ""),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      paddingOnly(
                        26.0,
                        10.0,
                        2.0,
                        10.0,
                        Column(
                          children: [
                            Obx(() => (optionBox(
                                "A",
                                questionsList[manageShowingContent
                                        .questionListVisibleIndex.value][
                                    manageShowingContent.language.value == "hin"
                                        ? "option1_hin"
                                        : "option1_eng"],
                                questionsList[manageShowingContent
                                    .questionListVisibleIndex
                                    .value]['answer']))),
                            Obx(() => (optionBox(
                                "B",
                                questionsList[manageShowingContent
                                        .questionListVisibleIndex.value][
                                    manageShowingContent.language.value == "hin"
                                        ? "option2_hin"
                                        : "option2_eng"],
                                questionsList[manageShowingContent
                                    .questionListVisibleIndex
                                    .value]['answer']))),
                            Obx(() => (optionBox(
                                "C",
                                questionsList[manageShowingContent
                                        .questionListVisibleIndex.value][
                                    manageShowingContent.language.value == "hin"
                                        ? "option3_hin"
                                        : "option3_eng"],
                                questionsList[manageShowingContent
                                    .questionListVisibleIndex
                                    .value]['answer']))),
                            Obx(() => (optionBox(
                                "D",
                                questionsList[manageShowingContent
                                        .questionListVisibleIndex.value][
                                    manageShowingContent.language.value == "hin"
                                        ? "option4_hin"
                                        : "option4_eng"],
                                questionsList[manageShowingContent
                                    .questionListVisibleIndex
                                    .value]['answer']))),

                            // // operation for 5th option
                            (questionsList[manageShowingContent
                                        .questionListVisibleIndex
                                        .value]['option5_hin'] ==
                                    "")
                                ? Container()
                                : optionBox(
                                    "E",
                                    questionsList[manageShowingContent
                                            .questionListVisibleIndex.value][
                                        manageShowingContent.language.value ==
                                                "hin"
                                            ? "option5_hin"
                                            : "option5_eng"],
                                    questionsList[manageShowingContent
                                        .questionListVisibleIndex
                                        .value]['answer']),
                          ],
                        ),
                      ),
                      Obx(() => solutionBox(questionsList[manageShowingContent
                              .questionListVisibleIndex.value][
                          manageShowingContent.language.value == "hin"
                              ? "solution_hin"
                              : "solution_eng"]))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

modalForChooseLanguageForEditing() {
  Get.to(const TextEditor());
}

Widget topbar1(context, icon, setName, screenName) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            paddingOnly(
                0.0,
                0.0,
                0.0,
                5.0,
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 20.0,
                  ),
                )),
            appBarNew(setName, 14, 10, 10, 10, 10),
            GestureDetector(
              onTap: () async {
                saveSelectedQuestionsAPI();
              },
              child: containerPro(
                paddingOnly(
                    2.0,
                    4.0,
                    2.0,
                    4.0,
                    Obx(() => Text(
                          "Save: ${manageShowingContent.selectedQuestions.length}",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900,
                            fontFamily: "serif",
                          ),
                        ))),
                Colors.white,
                Colors.transparent,
                2.0,
                2.0,
              ),
            ),
            (screenName == "question_selection_screen")
                ? selectAllQuestionWidget()
                : Container(),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                shuffleQuestion(screenName);
              },
              child: paddingOnly(
                0.0,
                10.0,
                0.0,
                16.0,
                Row(
                  children: [
                    getIconWidget(
                        Icons.shuffle_on_outlined, Colors.black, 22.0),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                filterButtonClick(context);
              },
              child: paddingOnly(
                0.0,
                20.0,
                0.0,
                16.0,
                Row(
                  children: [
                    getIconWidget(
                        Icons.filter_list_rounded, Colors.black, 22.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget questionPallete(totalQuestions, scrollToXIndex) {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (int i = 0; i < totalQuestions; i++)
          GestureDetector(
            onTap: () {
              manageShowingContentController.questionListVisibleIndex.value = i;

              try {
                scrollToXIndex(i);
              } catch (e) {
                print(e);
              }
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
                  (manageShowingContentController
                              .questionListVisibleIndex.value ==
                          i)
                      ? Colors.amber
                      : Colors.amber.shade100,
                  Colors.black),
            ),
          )
      ],
    ),
  );
}

Widget topbar2(bool showChangeIndex, scrollToXIndex) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Obx(() => (manageShowingContent.questionViewMode.value == 0)
              ? Container()
              : selectCheckBoxAndTimesUsedAndListButton(scrollToXIndex))
        ],
      ),
      showChangeIndex
          ? containerPro(
              paddingOnly(
                  2.0,
                  4.0,
                  2.0,
                  4.0,
                  GestureDetector(
                    onTap: () {
                      showJumpingPositions(manageShowingContent
                              .questionListForSelection[
                          manageShowingContent.questionListVisibleIndex.value]);
                    },
                    child: const Text(
                      "Change Index",
                      style: TextStyle(
                        fontFamily: "serif",
                        fontStyle: FontStyle.italic,
                        fontSize: 8.0,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Colors.yellow,
              Colors.white,
              10.0,
              52.0,
            )
          : Container(),
      langaugeToggleWidget(),
      containerPro(
        paddingOnly(
            2.0,
            4.0,
            2.0,
            4.0,
            GestureDetector(
              onTap: () {
                reportErrorModal(manageShowingContent.questionListForSelection[
                        manageShowingContent.questionListVisibleIndex.value]
                    ['record_id']);
              },
              child: const Text(
                "Report error",
                style: TextStyle(
                  fontFamily: "serif",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Colors.red,
        Colors.white,
        10.0,
        52.0,
      ),
    ],
  );
}

Widget questionWidget(text) {
  var htmlForRender = text;
  if (htmlForRender == null) {
    return Container();
  }
  htmlForRender = htmlForRender.replaceAll(r"\′", r"'");
  return Container(child: getMathJxOrHtmlWidget(htmlForRender));
}

Widget buttonWidgets(text, icon, function) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
    child: GFButton(
      shape: GFButtonShape.pills,
      color: Colors.white,
      onPressed: () async {
        if (function == "delete") {
          confirmationBox("delete", "Permanently delete this set");
        } else if (function == "sync") {
          confirmationBox("sync", "to sync data to the server");
        } else if (function == "image") {
          EasyLoading.showToast("feature coming soon");
        } else if (function == "transfer") {
          transferSet();
        } else if (function == "settings") {
          EasyLoading.show();
          await getSetConfigurationAPI();
          EasyLoading.dismiss();
          settingPanel();
        } else if (function == "copy_set") {
          copySet();
        } else if (function == "thumbnail") {
          EasyLoading.showInfo("Feature is in developement");
        }
      },
      text: text,
      textStyle: const TextStyle(
          fontFamily: "serif",
          color: Colors.black,
          fontWeight: FontWeight.bold),
      icon: Icon(
        icon,
        color: Colors.black,
      ),
    ),
  );
}

confirmationBox(function, middleText) {
  Get.defaultDialog(
    content: Column(
      children: [
        Text(
          middleText,
          style: const TextStyle(fontFamily: "serif"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GFButtonBadge(
                onPressed: () async {
                  if (function == "sync") {
                    Get.back();
                  } else if (function == "delete") {
                    final ManageShowingContent manageShowingContentController =
                        Get.put(ManageShowingContent());
                    final HomeScreenController homeScreenController =
                        Get.put(HomeScreenController());
                    await deleteSetAPI(manageShowingContentController
                        .selectedSetForOperation['set_id']);
                    homeScreenController.mySets.value = [];
                    getMySetsAPI();
                    Get.offAll(() => EntryScreen(
                          selectedTab: 1,
                        ));
                  }
                },
                text: "Confirm",
                color: Colors.blue,
                textStyle: const TextStyle(
                    fontFamily: "Mont",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                type: GFButtonType.solid,
              ),
              GFButtonBadge(
                onPressed: () {
                  Get.back();
                },
                text: "Cancel",
                color: Colors.grey,
                textStyle: const TextStyle(
                    fontFamily: "Mont",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                type: GFButtonType.outline,
              ),
            ],
          ),
        ),
      ],
    ),
    title: "Are you sure",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: Colors.red,
  );
}

Widget bottomAction() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          GestureDetector(
            onTap: () {
              previousQuestion();
            },
            child: paddingOnly(
                4.0,
                4.0,
                4.0,
                6.0,
                containerPro(
                    paddingOnly(12.0, 20.0, 12.0, 20.0,
                        getIconWidget(Icons.arrow_back, Colors.white, 20.0)),
                    Colors.amber.shade800,
                    Colors.amber.shade100,
                    4.0,
                    6.0)),
          ),
        ],
      ),
      GestureDetector(
        onTap: () {
          nextQuestion();
        },
        child: paddingOnly(
            4.0,
            4.0,
            4.0,
            6.0,
            containerPro(
                paddingOnly(
                    12.0,
                    60.0,
                    12.0,
                    60.0,
                    const Text(
                      "Next Question",
                      style: TextStyle(
                        fontFamily: "serif",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Colors.green,
                Colors.green,
                4.0,
                6.0)),
      ),
    ],
  );
}
