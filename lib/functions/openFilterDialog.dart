import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';

void openFilterDialog(context, editorPackageController) async {
  var filterListController = Get.put(FilterListController());
  await FilterListDialog.display(
    context,
    height: 500,
    backgroundColor: Colors.yellow,
    // enableOnlySingleSelection: true,
    listData: filterListController.listData,
    selectedListData: filterListController.selectedItem,
    choiceChipLabel: (item) => item,
    validateSelectedItem: (list, val) => list!.contains(val),
    onApplyButtonClick: (list) {
      filterListController.selectedItem = (List<String>.from(list!));
      editorPackageController.setText(list.join(","));
      Get.back();
    },
    onItemSearch: (item, String query) {
      return item.toLowerCase().contains(query.toLowerCase());
    },
  );
}

void openContentFilterDialog(context) async {
  var filterListController = Get.put(FilterListController());
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  await FilterListDialog.display(
    context,
    height: 500,
    backgroundColor: Colors.yellow,
    enableOnlySingleSelection: true,
    listData: filterListController.listData,
    selectedListData: filterListController.selectedItem,
    choiceChipLabel: (item) => item,
    validateSelectedItem: (list, val) => list!.contains(val),
    onApplyButtonClick: (list) {
      filterListController.selectedItem = (List<String>.from(list!));

      if (list.isNotEmpty) {
        manageShowingContent.questionListVisibleIndex.value = 0;

        List filteredData = manageShowingContent.questionListForSelectionBackup
            .where((question) => question["type"].contains(list[0]))
            .toList();
        manageShowingContent.questionListForSelection.value = filteredData;
        EasyLoading.showToast(
            "${manageShowingContent.questionListForSelection.length} questions found");
      } else {
        manageShowingContent.questionListForSelection.value =
            manageShowingContent.questionListForSelectionBackup;
      }

      Get.back();
    },
    onItemSearch: (item, String query) {
      return item.toLowerCase().contains(query.toLowerCase());
    },
  );
}
