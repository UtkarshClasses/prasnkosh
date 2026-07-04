import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/updateIndividualQuestionToDBAPI.dart';
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';

Widget editorScreenFloatingButtons(htmlEditorController) {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.pink,
              onPressed: () =>
                  {updateIndividualQuestionToDB(htmlEditorController)},
              child: const Icon(Icons.upload_file),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "btn5",
            backgroundColor: Colors.blue,
            onPressed: () => {htmlEditorController.undo()},
            child: const Icon(Icons.undo),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "btn6",
            backgroundColor: Colors.blueGrey,
            onPressed: () => {htmlEditorController.redo()},
            child: const Icon(Icons.redo),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "btn3",
            backgroundColor: Colors.orange,
            onPressed: () => {
              if (manageShowingContentController.questionListVisibleIndex > 0)
                {
                  manageShowingContentController.questionListVisibleIndex =
                      manageShowingContentController.questionListVisibleIndex -
                          1,
                  changeQuestion(htmlEditorController)
                }
              else
                {EasyLoading.showInfo("This is first question")}
            },
            child: const Icon(Icons.navigate_before),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "btn4",
            backgroundColor: Colors.greenAccent,
            onPressed: () => {
              if (manageShowingContentController
                      .questionListVisibleIndex.value <
                  (manageShowingContentController
                          .questionListForSelection.length) -
                      1)
                {
                  manageShowingContentController.questionListVisibleIndex =
                      manageShowingContentController.questionListVisibleIndex +
                          1,
                  changeQuestion(htmlEditorController)
                }
              else
                {EasyLoading.showInfo("This is last question")}
            },
            child: const Icon(Icons.navigate_next),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.black,
            onPressed: () => {htmlEditorController.toggleCodeView()},
            child: const Icon(Icons.code),
          ),
        ),
      ]),
    ),
  );
}

void changeQuestion(htmlEditorController) {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  final EditorController editorController = Get.put(EditorController());

  htmlEditorController.setText(
      manageShowingContentController.questionListForSelection[
              manageShowingContentController.questionListVisibleIndex.value][
          editorController
              .columnNames[editorController.editorSelectedColumnIndex.value]]);
}
