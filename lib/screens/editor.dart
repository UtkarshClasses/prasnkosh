import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/editor_column_names.dart';
import 'package:teach_advance/utility/editor_screen_floating_buttons.dart';
import 'package:teach_advance/utility/editor_show_question_accordion.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  State<TextEditor> createState() => _TextEditorState();
}

HtmlEditorController controller = HtmlEditorController();

class _TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    final ManageShowingContent manageShowingContentController =
        Get.put(ManageShowingContent());

    final EditorController editorController = Get.put(EditorController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            showQuestionAccordion(controller),
            columnNames(controller, context),
            Obx(() => editor(
                controller,
                manageShowingContentController.questionListForSelection[
                    manageShowingContentController.questionListVisibleIndex
                        .value][editorController.columnNames[
                    editorController.editorSelectedColumnIndex.value]])),
          ],
        ),
        floatingActionButton: editorScreenFloatingButtons(controller),
      ),
    );
  }
}

Widget editor(controller, initialText) {
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
    otherOptions: const OtherOptions(
      height: 290,
    ),
  );
}
