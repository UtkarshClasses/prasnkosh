import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'widget_of_question_show_screen.dart';

Widget showQuestionAccordion(htmlEditorPackageController) {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  var filterListController = Get.put(FilterListController());

  return GFAccordion(
      titleChild: const Text(
        "Show Question",
        style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.bold),
      ),
      contentChild: Obx(() => Column(
            children: [
              questionWidget("Q" +
                  manageShowingContentController.questionListForSelection[
                          manageShowingContentController
                              .questionListVisibleIndex.value]['question_no']
                      .toString() +
                  ". " +
                  manageShowingContentController.questionListForSelection[
                          manageShowingContentController
                              .questionListVisibleIndex.value][
                      manageShowingContentController.language.value == "hin"
                          ? "question_hin"
                          : "question_eng"]),
              suggestionSearch(
                  filterListController.listData, htmlEditorPackageController),
            ],
          )),
      collapsedIcon: const Icon(Icons.expand_circle_down_rounded),
      expandedIcon: const Icon(Icons.expand_less_rounded));
}

Widget suggestionSearch(list, htmlEditorPackageController) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, top: 10.0, right: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        color: Colors.white,
        child: GFSearchBar(
          overlaySearchListHeight: 100.0,
          searchBoxInputDecoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            hintText: "Search suggestion ...",
          ),
          searchList: list,
          searchQueryBuilder: (query, list) {
            return list
                .where((item) =>
                    item.toString().toLowerCase().contains(query.toLowerCase()))
                .toList();
          },
          noItemsFoundWidget: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("No data found!"),
          ),
          overlaySearchListItemBuilder: (item) {
            return suggestionList(item, htmlEditorPackageController);
          },
          onItemSelected: (item) {
            print("item selected");
          },
        ),
      ),
    ),
  );
}

Widget suggestionList(item, htmlEditorPackageController) {
  return ListTile(
    title: Text(
      item,
      style: const TextStyle(
        fontSize: 12.0,
        fontFamily: "Nunito",
        fontWeight: FontWeight.bold,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GFButton(
          color: colors.leftGradient,
          type: GFButtonType.outline,
          onPressed: () => {
            htmlEditorPackageController.setText(item),
          },
          child: const Text(
            "Ok",
            style: TextStyle(fontFamily: "serif"),
          ),
        )
      ],
    ),
  );
}
