import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/filter_data.dart';
import 'package:teach_advance/utility/FilterScreenComponents/selected_items_chips_widget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

import '../../controllers/filter_list_controller.dart';

Widget cityFilterWidget(context) {
  var filterListController = Get.put(FilterListController());
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Card(
      color: Colors.white,
      elevation: 10.0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 90),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(color: colors.leftGradientLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "City",
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
                      Data data1 =
                          Data(id: "0", title: "Jodhpur", coverImage: "");
                      Data data2 =
                          Data(id: "0", title: "Jaipur", coverImage: "");
                      Data data3 =
                          Data(id: "0", title: "Prayagraj", coverImage: "");
                      Data data4 =
                          Data(id: "0", title: "Indore", coverImage: "");
                      List<dynamic> data12 = [];
                      data12.add(data1);
                      data12.add(data2);
                      data12.add(data3);
                      data12.add(data4);
                      List<dynamic> data = [
                        "Jodhpur",
                        "Jaipur",
                        "Prayagraj",
                        "Indore"
                      ];
                      filterListController
                          .filtersMap['City']['possible_item'].value = data;
                      // filterListController
                      //     .filtersMap['City']['selected_item'].value = data12;
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
                filterListController.filtersMap["City"]['selected_item'])),
          ],
        ),
      ),
    ),
  );
}

void openFilterDialog(context) async {
  var filterListController = Get.put(FilterListController());
  List<dynamic> selectedItem =
      filterListController.filtersMap['City']['selected_item'].value;
  List<String> dataStr = [];
  selectedItem.forEach((element) {
    dataStr.add(element.title!);
  });
  await FilterListDialog.display(
    context,
    height: 500,
    backgroundColor: Colors.yellow,
    listData:
        filterListController.filtersMap['City']['possible_item'].cast<String>(),
    selectedListData: dataStr,
    enableOnlySingleSelection: true,
    choiceChipLabel: (item) => item,
    validateSelectedItem: (list, val) => list!.contains(val),
    onApplyButtonClick: (list) {
      List<dynamic> data = [];
      list?.forEach((element) {
        Data data1 = Data(id: "0", title: element, coverImage: "");
        data.add(data1);
      });
      filterListController.filtersMap["City"]["selected_item"].value = data;
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
            margin: const EdgeInsets.all(5),
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
