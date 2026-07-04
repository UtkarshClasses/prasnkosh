import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/functions/editorScreenColumnButtonClick.dart';

Widget columnNames(controller, context) {
  final EditorController editorController = Get.put(EditorController());

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Wrap(
      runAlignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        for (int i = 0; i < editorController.columnNames.length; i++)
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
                        text: editorController.columnNames[i]
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
