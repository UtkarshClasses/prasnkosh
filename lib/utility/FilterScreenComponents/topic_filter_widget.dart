import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/filter_data.dart';
import 'package:teach_advance/apis/getSuggestionsAPI.dart';
import 'package:teach_advance/utility/FilterScreenComponents/selected_items_chips_widget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

import '../../controllers/filter_list_controller.dart';

Widget topicFilterWidget(context) {
  var filterListController = Get.put(FilterListController());
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Card(
      color: Colors.white,
      elevation: 10.0,
      child: SizedBox(
        height: 90,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: colors.leftGradientLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Topic",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          color: colors.leftGradient,
                          fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      EasyLoading.show(status: "Loading", dismissOnTap: true);
                      List<Data> data = await getSuggestionsAPI("topic");
                      filterListController
                          .filtersMap['Topic']['possible_item'].value = data;
                      EasyLoading.dismiss();
                      openFilterDialog(context);
                    },
                    child: Icon(
                      Icons.filter_list_rounded,
                      color: Colors.blueGrey.shade700,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Obx(() => selectedItemChips(
                filterListController.filtersMap["Topic"]['selected_item'])),
          ],
        ),
      ),
    ),
  );
}

void openFilterDialog(context) async {
  var filterListController = Get.put(FilterListController());
  List<Data> selectedItem =
      filterListController.filtersMap['Topic']['selected_item'].cast<Data>();
  await FilterListDialog.display(
    context,
    height: 500,
    backgroundColor: Colors.yellow,
    listData:
        filterListController.filtersMap['Topic']['possible_item'].cast<Data>(),
    selectedListData: selectedItem,
      choiceChipLabel: (item) => item!.title,
    validateSelectedItem: (list, val) => list!.contains(val),
    onApplyButtonClick: (list) {
      filterListController.filtersMap["Topic"]["selected_item"].value = list;
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
            labelPadding: const EdgeInsets.all(6),
            selectedTextStyle: const TextStyle(
                fontFamily: "Poppins", fontWeight: FontWeight.w600),
            textStyle: const TextStyle(
                fontFamily: "Poppins", fontWeight: FontWeight.w600)),
        headerTheme: const HeaderThemeData(
            headerTextStyle: TextStyle(fontFamily: "Poppins"))),
    onItemSearch: (item, String query) {
      return item.title!.toLowerCase().contains(query.toLowerCase());
    },
  );
}
