import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/apis/copySetAPi.dart';
import 'package:teach_advance/controllers/home_screen_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/chipInList.dart';

final ManageShowingContent manageShowingContentController =
    Get.put(ManageShowingContent());
final HomeScreenController homeScreenController =
    Get.put(HomeScreenController());

Widget copySetToSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        color: Colors.white,
        child: GFSearchBar(
          searchBoxInputDecoration: const InputDecoration(
            hintText: "Select set for copying ...",
          ),
          searchList: homeScreenController.mySetsBackup,
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
            return suggestionList(item);
          },
          onItemSelected: (item) {
            print(item);
          },
        ),
      ),
    ),
  );
}

Widget suggestionList(item) {
  return ListTile(
    title: Text(
      item['set_name'].toString(),
      style: const TextStyle(
        fontSize: 12.0,
        fontFamily: "Nunito",
        fontWeight: FontWeight.bold,
      ),
    ),
    trailing: (item['set_id'] !=
            manageShowingContentController.selectedSetForOperation['set_id'])
        ? ElevatedButton(
            onPressed: () async {
              copySetAPI(
                  manageShowingContentController
                      .selectedSetForOperation['set_id'],
                  item['set_id']);
            },
            child: const Text("Ok"))
        : const Text(""),
    subtitle: Row(
      children: [
        chipInList(Colors.blueGrey.shade50, Colors.black,
            ("${item['questions_selected']} Ques.")),
        chipInList(
            Colors.blueGrey.shade50, Colors.black, (item['created_date'])),
      ],
    ),
  );
}
