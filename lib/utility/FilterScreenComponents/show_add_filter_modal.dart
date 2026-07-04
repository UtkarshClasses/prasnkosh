import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

void addFilterModal(context) async {
  var filterListController = Get.put(FilterListController());
  List<String> selectedItem =
      filterListController.filtersMap["addFilterModalData"]["selectedItem"];
  await FilterListDialog.display(
    context,
    height: 500,
    backgroundColor: Colors.yellow,
    listData: filterListController.filtersMap["addFilterModalData"]
        ["possible_item"],
    selectedListData: selectedItem,
    choiceChipLabel: (item) => item,
    validateSelectedItem: (list, val) => list!.contains(val),
    onApplyButtonClick: (list) {
      filterListController.filtersMap["addFilterModalData"]["selectedItem"] =
          list;
      for (var element in filterListController.filtersMap["addFilterModalData"]
          ["possible_item"]) {
        if (list!.contains(element)) {
          filterListController.filtersMap[element]['visibility'].value = true;
        } else {
          filterListController.filtersMap[element]['visibility'].value = false;
          filterListController.filtersMap[element]['selected_item'].value = [];
          filterListController.filtersMap[element]['possible_item'].value = [];
          filterListController
              .filtersMap['lastColumnHitForGettingDiscussion'].value = "";
        }
      }
      Get.back();
    },
    themeData: FilterListThemeData(context,
        backgroundColor: Colors.white,
        controlButtonBarTheme: ControlButtonBarThemeData(
          context,
          controlButtonTheme: ControlButtonThemeData(
              textStyle: TextStyle(color: colors.leftGradient),
              primaryButtonBackgroundColor: colors.leftGradient),
        ),
        choiceChipTheme: ChoiceChipThemeData(
            selectedBackgroundColor: colors.leftGradient,
            labelPadding: const EdgeInsets.all(4),
            selectedTextStyle: const TextStyle(
                fontFamily: "Poppins", fontWeight: FontWeight.w600),
            textStyle: const TextStyle(
                fontFamily: "Poppins", fontWeight: FontWeight.w600)),
        headerTheme: const HeaderThemeData(
            headerTextStyle: TextStyle(fontFamily: "Poppins"))),
    onItemSearch: (item, String query) {
      return item.toLowerCase().contains(query.toLowerCase());
    },
  );
}
