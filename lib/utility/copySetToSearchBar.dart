import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

copySetWebSet() {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> sets = [];
  for (var i = 0; i < homeScreenController.mySetsBackup.length; i++) {
    sets.add(homeScreenController.mySetsBackup[i]['set_name'] +
        "(" +
        homeScreenController.mySetsBackup[i]['set_id'] +
        ")");
  }
  ValueNotifier<String> textV = new ValueNotifier("");
  final TextEditingController receiverUserId = TextEditingController();
  return Get.defaultDialog(
    content: Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0, left: 6, right: 6),
            child: ValueListenableBuilder<String>(
              valueListenable: textV,
              builder: (BuildContext context, String value, child) {
                return SimpleAutoCompleteTextField(
                  key: key,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: receiverUserId,
                  textChanged: (text) {

                  },
                  decoration: const InputDecoration(
                      hintText: "Search Set ID",
                      hintStyle: TextStyle(fontFamily: "serif"),
                      labelStyle: TextStyle(color: Color(0xFF424242)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  suggestions: sets,
                  textSubmitted: (text) async
                  {
                    textV.value=text;
                    receiverUserId.text = text;
                    manageShowingContentController.setChangeValue.value = 1;
                  },

                );
              },
            ),


        ),
      ],
    ),
    confirm: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () async {
            if (receiverUserId.value.text.isNotEmpty) {
              Get.back();
              copySetAPI(
                  manageShowingContentController
                      .selectedSetForOperation['set_id'],
                  receiverUserId.value.text);
            } else {
              EasyLoading.showToast("Please Enter Set ID");
            }
          },
          child: const Text(
            'Copy Set',
            style: TextStyle(
              fontFamily: 'Mont',
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    ),
    title: "Copy Set",
    titlePadding:
    const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: Colors.blue,
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
    subtitle: InkWell(
      onTap: () async {
        copySetAPI(
            manageShowingContentController.selectedSetForOperation['set_id'],
            item['set_id']);
      },
      child: Row(
        children: [
          chipInList(Colors.blueGrey.shade50, Colors.black,
              ("${item['questions_selected']} Ques.")),
          chipInList(
              Colors.blueGrey.shade50, Colors.black, (item['created_date'])),
        ],
      ),
    ),
  );
}
