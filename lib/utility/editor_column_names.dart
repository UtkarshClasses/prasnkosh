import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/functions/editorScreenColumnButtonClick.dart';

import '../controllers/manage_showing_content.dart';
import 'language_toggle_button.dart';

Widget columnNames(controller, context) {
  final EditorController editorController = Get.put(EditorController());
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Wrap(
      runAlignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        Obx(() => GFButtonBadge(
              size: GFSize.SMALL,
              shape: GFButtonShape.pills,
              onPressed: () async {
                if (manageShowingContent.language.value == "eng") {
                  manageShowingContent.language.value = "hin";
                } else if (manageShowingContent.language.value == "hin") {
                  manageShowingContent.language.value = "eng";
                }
              },
              text: manageShowingContent.language.value == "hin"
                  ? "Hindi"
                  : "English",
              color: manageShowingContent.language.value == "hin"
                  ? Colors.deepOrange
                  : Colors.pink,
              textStyle: const TextStyle(
                  fontSize: 10,
                  fontFamily: "Mont",
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        const SizedBox(
          width: 10,
        ),
        for (int i = 0; i < editorController.columnNameShow.length; i++)
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 1.0),
                      child: GFButtonBadge(
                        size: GFSize.SMALL,
                        shape: GFButtonShape.pills,
                        onPressed: () async {
                          editorScreenColumnButtonOnClick(
                              controller, i, context);
                        },
                        text: editorController.columnNameShow[i]
                            .toUpperCase()
                            .replaceAll("_", " "),
                        color: Colors.pink,
                        textStyle: TextStyle(
                          fontSize: 10,
                          fontFamily: "Mont",
                          fontWeight: FontWeight.bold,
                          color: editorController
                                      .editorSelectedColumnIndex.value ==
                                  i
                              ? Colors.white
                              : Colors.pink,
                        ),
                        type:
                            editorController.editorSelectedColumnIndex.value ==
                                    i
                                ? GFButtonType.solid
                                : GFButtonType.outline,
                      ),
                    ));
              }),
      ],
    ),
  );
}
