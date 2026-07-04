import 'package:get/get.dart';
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/openFilterDialog.dart';

editorScreenColumnButtonOnClick(editorPackageController, i, context) {
  final EditorController editorController = Get.put(EditorController());
  editorController.editorSelectedColumnIndex.value = i;
  if (i == 4 || i == 5 || i == 6) {
    var filterListController = Get.put(FilterListController());
    filterListController.selectedItem = [];
    setValueToEditorBox(editorPackageController);
    openFilterDialog(context, editorPackageController);
  } else {
    setValueToEditorBox(editorPackageController);
  }
}

setValueToEditorBox(editorPackageController) {
  final EditorController editorController = Get.put(EditorController());
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  if (manageShowingContentController.questionListForSelection[
              manageShowingContentController.questionListVisibleIndex.value][
          editorController
              .columnNames[editorController.editorSelectedColumnIndex.value]] !=
      null) {
    editorPackageController.setText(manageShowingContentController
                .questionListForSelection[
            manageShowingContentController.questionListVisibleIndex.value][
        editorController
            .columnNames[editorController.editorSelectedColumnIndex.value]]);
  } else {
    editorPackageController.setText("");
  }
}
