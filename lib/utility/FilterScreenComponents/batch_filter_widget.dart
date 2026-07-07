import 'dart:convert';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/utility/FilterScreenComponents/selected_items_chips_widget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:get_storage/get_storage.dart' as getstorage;
import '../../apis/batch_data.dart';
import '../../apis/filter_data.dart';
import '../../controllers/filter_list_controller.dart';

Widget batchFilterWidget(context) {
  var filterListController = Get.put(FilterListController());
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child:

        // Stack(
        //   children: <Widget>[
        //     Container(
        //       width: double.infinity,
        //       height: 60,
        //       margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        //       padding: const EdgeInsets.only(bottom: 10),
        //       decoration: BoxDecoration(
        //         border: Border.all(
        //             color: Colors.black12, width: 1),
        //         borderRadius: BorderRadius.circular(5),
        //         shape: BoxShape.rectangle,
        //       ),
        //     ),
        //     Positioned(
        //       left: 50,
        //       top: 12,
        //       child: Container(
        //         padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        //         color: Colors.white,
        //         child: const Text(
        //           'Batch',
        //           style: TextStyle(color: Colors.black, fontSize: 12),
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       left: 20,
        //
        //       top: 30,
        //       child: Container(
        //         width: MediaQuery.of(context).size.width,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Obx(() {
        //               List<dynamic> data = [];
        //               filterListController.filtersMap["Batch"]['selected_item']
        //                   ?.forEach((element) {
        //                 Data data1 = Data(
        //                     id: element.batId,
        //                     title: element.batchName,
        //                     coverImage: "");
        //                 data.add(data1);
        //               });
        //               return selectedItemChips(data);
        //             }),
        //             GestureDetector(
        //               onTap: () async {
        //                 List<dynamic> selectedItem = filterListController
        //                     .filtersMap['City']['selected_item'].value;
        //                 List<String> dataStr = [];
        //                 for (var element in selectedItem) {
        //                   dataStr.add(element.title!);
        //                 }
        //                 if (dataStr.isEmpty) {
        //                   EasyLoading.showToast("Please select city");
        //                   return;
        //                 }
        //                 EasyLoading.show(status: "Loading", dismissOnTap: true);
        //                 List<Batch>? data = await getBatch();
        //                 filterListController
        //                     .filtersMap['Batch']['possible_item'].value = data;
        //                 EasyLoading.dismiss();
        //                 openFilterDialog(context, data!);
        //               },
        //               child: const Icon(
        //                 Icons.keyboard_arrow_down,
        //                 color: Colors.black12,
        //                 size: 30,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //
        //
        //   ],
        // ));

        Card(
      color: Colors.white,
      elevation: 10.0,
      child: SizedBox(
        height: 90,
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                List<dynamic> selectedItem = filterListController
                    .filtersMap['City']['selected_item'].value;
                List<String> dataStr = [];
                for (var element in selectedItem) {
                  dataStr.add(element.title!);
                }
                if (dataStr.isEmpty) {
                  EasyLoading.showToast("Please select city");
                  return;
                }
                EasyLoading.show(status: "Loading", dismissOnTap: true);
                List<Batch>? data = await getBatch();
                filterListController
                    .filtersMap['Batch']['possible_item'].value = data;
                EasyLoading.dismiss();
                openFilterDialog(context, data!);
              },
              child: Container(
                decoration: BoxDecoration(color: colors.leftGradientLight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Batch",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: colors.leftGradient,
                            fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        List<dynamic> selectedItem = filterListController
                            .filtersMap['City']['selected_item'].value;
                        List<String> dataStr = [];
                        for (var element in selectedItem) {
                          dataStr.add(element.title!);
                        }
                        if (dataStr.isEmpty) {
                          EasyLoading.showToast("Please select city");
                          return;
                        }
                        EasyLoading.show(status: "Loading", dismissOnTap: true);
                        List<Batch>? data = await getBatch();
                        filterListController
                            .filtersMap['Batch']['possible_item'].value = data;
                        EasyLoading.dismiss();
                        openFilterDialog(context, data!);
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
            ),
            Obx(() {
              List<dynamic> data = [];
              filterListController.filtersMap["Batch"]['selected_item']
                  ?.forEach((element) {
                Data data1 = Data(
                    id: element.batId,
                    title: element.batchName,
                    coverImage: "");
                data.add(data1);
              });
              return selectedItemChips(data);
            }),
          ],
        ),
      ),
    ),
  );
}

void openFilterDialog(context, List<Batch> data) async {
  var filterListController = Get.put(FilterListController());
  List<Batch> selectedItem =
      filterListController.filtersMap['Batch']['selected_item'].cast<Batch>();
  await FilterListDialog.display(
    context,
    height: 500,
    backgroundColor: Colors.yellow,
    listData: data,
    selectedListData: selectedItem,
    choiceChipLabel: (item) => "${item?.batchName}(${item!.batId})",
    validateSelectedItem: (list, val) => list!.contains(val),
    onApplyButtonClick: (list) {
      filterListController.filtersMap["Batch"]["selected_item"].value = list;
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
      return item.batchName
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    },
  );
}

Future<List<Batch>?> getBatch() async {
  final userDetails = getstorage.GetStorage();
  var token = userDetails.read('token');
  var filterListController = Get.put(FilterListController());
  List<dynamic> selectedItem =
      filterListController.filtersMap['City']['selected_item'].value;
  List<String> dataStr = [];
  for (var element in selectedItem) {
    dataStr.add(element.title!);
  }

  var url = Uri.parse('${globalvariable.nodeBaseURL}getFilter');
  var response = await http.post(
    url,
    body: {'token': token, 'columnName': "batch", 'payload': dataStr.join(",")},
  );
  var temp = BatchData.fromJson(jsonDecode(response.body));
  return temp.data;
}
