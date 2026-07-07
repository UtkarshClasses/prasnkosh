import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/editor_column_names.dart';
import 'package:teach_advance/utility/editor_screen_floating_buttons.dart';
import 'package:teach_advance/utility/editor_show_question_accordion.dart';

import '../utility/optionBox.dart';
import '../utility/solutionBoxWidget.dart';
import '../utility/widget_of_question_show_screen.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  State<TextEditor> createState() => _TextEditorState();
}

HtmlEditorController controller = HtmlEditorController();

final VisibleEditController visibleEditController =
    Get.put(VisibleEditController());
late String? contentHtml = "";

class _TextEditorState extends State<TextEditor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ManageShowingContent manageShowingContentController =
        Get.put(ManageShowingContent());
    visibleEditController.isEditorVisible.value = 1;
    final EditorController editorController = Get.put(EditorController());
    var dataList = manageShowingContentController.questionListForSelection[
        manageShowingContentController.questionListVisibleIndex.value];
    final OptionData optionData = Get.put(OptionData());
    optionData.controllerQue_Eng.value = dataList["question_eng"] ?? "";
    optionData.controllerQue_hindi.value = dataList["question_hin"] ?? "";
    optionData.controllerOp1_hindi.value = dataList["option1_hin"] ?? "";
    optionData.controllerOp1_Eng.value = dataList["option1_eng"] ?? "";
    optionData.controllerOp2_Eng.value = dataList["option2_eng"] ?? "";
    optionData.controllerOp2_hindi.value = dataList["option2_hin"] ?? "";
    optionData.controllerOp3_Eng.value = dataList["option3_eng"] ?? "";
    optionData.controllerOp3_hindi.value = dataList["option3_hin"] ?? "";
    optionData.controllerOp4_Eng.value = dataList["option4_eng"] ?? "";
    optionData.controllerOp4_hindi.value = dataList["option4_hin"] ?? "";
    optionData.controllerOp5_Eng.value = dataList["option5_eng"] ?? "";
    optionData.controllerOp5_hindi.value = dataList["option5_hin"] ?? "";
    optionData.controllerSolu_Eng.value = dataList["solution_eng"] ?? "";
    optionData.controllerSolu_hindi.value = dataList["solution_hin"] ?? "";
    optionData.controllerAns.value = dataList["answer"] ?? "";
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Platform.isWindows?  InkWell(
              //       onTap: () {
              //         Get.back();
              //       },
              //       child: const Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Icon(Icons.arrow_back_outlined),
              //       )):Container(),
                showQuestionAccordion(controller),
                columnNames(controller, context),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 1;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 0
                      : editorController.editorSelectedColumnIndex.value = 1;

                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerQue_hindi.value
                          : optionData.controllerQue_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? question =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerQue_hindi.value
                          : optionData.controllerQue_Eng.value;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: questionWidget(
                        question.isNotEmpty ? question : "Enter Question"),
                  );
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 2;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 8
                      : editorController.editorSelectedColumnIndex.value = 9;

                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp1_hindi.value
                          : optionData.controllerOp1_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? option1 =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp1_hindi.value
                          : optionData.controllerOp1_Eng.value;
                  return optionBox("A", option1 ?? "Enter option",
                      optionData.controllerAns.value);
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 3;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 10
                      : editorController.editorSelectedColumnIndex.value = 11;
                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp2_hindi.value
                          : optionData.controllerOp2_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? option2 =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp2_hindi.value
                          : optionData.controllerOp2_Eng.value;
                  return optionBox("B", option2 ?? "Enter Option",
                      optionData.controllerAns.value);
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 4;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 12
                      : editorController.editorSelectedColumnIndex.value = 13;
                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp3_hindi.value
                          : optionData.controllerOp3_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? option3 =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp3_hindi.value
                          : optionData.controllerOp3_Eng.value;

                  return optionBox("C", option3 ?? "Enter Option",
                      optionData.controllerAns.value);
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 5;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 14
                      : editorController.editorSelectedColumnIndex.value = 15;
                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp4_hindi.value
                          : optionData.controllerOp4_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? option4 =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp4_hindi.value
                          : optionData.controllerOp4_Eng.value;
                  return optionBox("D", option4 ?? "Enter Option",
                      optionData.controllerAns.value);
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 6;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 16
                      : editorController.editorSelectedColumnIndex.value = 17;
                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp5_hindi.value
                          : optionData.controllerOp5_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? option5 =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerOp5_hindi.value
                          : optionData.controllerOp5_Eng.value;
                  return optionBox("E", option5 ?? "Enter Option",
                      optionData.controllerAns.value);
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 2;
                  editorController.editorSelectedColumnIndex.value = 18;
                  editorDialog(context, optionData.controllerAns.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  return optionBox(
                      "",
                      "Answer: - ${optionData.controllerAns.value}",
                      optionData.controllerAns.value);
                })),
                InkWell(onTap: () {
                  visibleEditController.isEditorVisible.value = 7;
                  manageShowingContentController.language.value == "hin"
                      ? editorController.editorSelectedColumnIndex.value = 2
                      : editorController.editorSelectedColumnIndex.value = 3;
                  editorDialog(
                      context,
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerSolu_hindi.value
                          : optionData.controllerSolu_Eng.value,
                      editorController.editorSelectedColumnIndex.value);
                }, child: Obx(() {
                  String? solution =
                      manageShowingContentController.language.value == "hin"
                          ? optionData.controllerSolu_hindi.value
                          : optionData.controllerSolu_Eng.value;

                  return solutionBox(
                      solution.isNotEmpty ? solution : "Enter solution","","");
                }))
              ],
            ),
          ),
        ),
        floatingActionButton: editorScreenFloatingButtons(controller),
      ),
    );
  }
}

Widget editorWidget(manageShowingContentController, editorController, height,
    HtmlEditorController htmlController) {
  // getHtmlText(htmlController);
  // getHtmlText(controllerQue_Eng).then((value) {
  //   content = value;
  // });
  return editor(
      htmlController,
      contentHtml!.isNotEmpty
          ? contentHtml
          : manageShowingContentController.questionListForSelection[
              manageShowingContentController
                  .questionListVisibleIndex.value][editorController
              .columnNames[editorController.editorSelectedColumnIndex.value]],
      height);
}

getHtmlText(HtmlEditorController htmlController) async {
  contentHtml = await htmlController.getText();
}

Widget editor(controller, initialText, height) {
  return HtmlEditor(
    controller: controller,
    htmlToolbarOptions: HtmlToolbarOptions(
      renderBorder: true,
      buttonBorderWidth: 4.0,
      buttonBorderRadius: BorderRadius.circular(6),
      buttonColor: Colors.blueGrey,
      defaultToolbarButtons: [
        const ListButtons(),
        const FontButtons(clearAll: true),
        const ColorButtons(),
        const ParagraphButtons(
          alignLeft: true,
          alignRight: true,
          alignCenter: true,
          lineHeight: false,
          textDirection: false,
          alignJustify: true,
        ),
        const FontSettingButtons(
          fontName: false,
          fontSize: false,
          fontSizeUnit: false,
        ),
        const StyleButtons(),
        const InsertButtons(
            picture: true,
            video: false,
            audio: false,
            table: true,
            otherFile: true)
      ],
      toolbarPosition: ToolbarPosition.belowEditor,
      toolbarItemHeight: 50,
      toolbarType: ToolbarType.nativeScrollable,
    ),
    htmlEditorOptions: HtmlEditorOptions(
      shouldEnsureVisible: true,
      initialText: initialText,
    ),
    otherOptions: OtherOptions(
      height: height,
    ),
  );
}

class VisibleEditController extends GetxController {
  var isEditorVisible = 1.obs;

  isVisible() => isEditorVisible;
}

class OptionData extends GetxController {
  RxString controllerQue_hindi = "".obs;
  RxString controllerQue_Eng = "".obs;
  RxString controllerOp1_hindi = "".obs;
  RxString controllerOp1_Eng = "".obs;
  RxString controllerOp2_hindi = "".obs;
  RxString controllerOp2_Eng = "".obs;
  RxString controllerOp3_hindi = "".obs;
  RxString controllerOp3_Eng = "".obs;
  RxString controllerOp4_hindi = "".obs;
  RxString controllerOp4_Eng = "".obs;
  RxString controllerOp5_hindi = "".obs;
  RxString controllerOp5_Eng = "".obs;
  RxString controllerSolu_hindi = "".obs;
  RxString controllerSolu_Eng = "".obs;
  RxString controllerAns = "".obs;
}

editorDialog(BuildContext context, initialText, int num) {
  HtmlEditorController controller = HtmlEditorController();
  final OptionData optionData = Get.put(OptionData());
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              editor(controller, initialText, 250.toDouble()),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.pink,
                        onPressed: () async {
                          if (num == 0) {
                            optionData.controllerQue_hindi.value =
                                await controller.getText();
                          } else if (num == 1) {
                            optionData.controllerQue_Eng.value =
                                await controller.getText();
                          } else if (num == 2) {
                            optionData.controllerSolu_hindi.value =
                                await controller.getText();
                          } else if (num == 3) {
                            optionData.controllerSolu_Eng.value =
                                await controller.getText();
                          } else if (num == 8) {
                            optionData.controllerOp1_hindi.value =
                                await controller.getText();
                          } else if (num == 9) {
                            optionData.controllerOp1_Eng.value =
                                await controller.getText();
                          } else if (num == 10) {
                            optionData.controllerOp2_hindi.value =
                                await controller.getText();
                          } else if (num == 11) {
                            optionData.controllerOp2_Eng.value =
                                await controller.getText();
                          } else if (num == 12) {
                            optionData.controllerOp3_hindi.value =
                                await controller.getText();
                          } else if (num == 13) {
                            optionData.controllerOp3_Eng.value =
                                await controller.getText();
                          } else if (num == 14) {
                            optionData.controllerOp4_hindi.value =
                                await controller.getText();
                          } else if (num == 15) {
                            optionData.controllerOp4_Eng.value =
                                await controller.getText();
                          } else if (num == 16) {
                            optionData.controllerOp5_hindi.value =
                                await controller.getText();
                          } else if (num == 17) {
                            optionData.controllerOp5_Eng.value =
                                await controller.getText();
                          } else if (num == 18) {
                            optionData.controllerAns.value =
                                await controller.getText();
                            optionData.controllerAns.value.toUpperCase();
                          }

                          Get.back();
                        },
                        child: const Icon(Icons.done),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      heroTag: "btn5",
                      backgroundColor: Colors.blue,
                      onPressed: () => {controller.undo()},
                      child: const Icon(Icons.undo),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      heroTag: "btn6",
                      backgroundColor: Colors.blueGrey,
                      onPressed: () => {controller.redo()},
                      child: const Icon(Icons.redo),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
