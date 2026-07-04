import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gradient_container/gradient_container.dart';
import 'package:teach_advance/utility/chipInList.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;
import 'package:teach_advance/utility/update_set_details.dart';

import '../functions/homeScreenAddQuestionButtonClick.dart';
import '../functions/homeScreenViewSelectedQuestionButtonClick.dart';

Widget homeScreenSearchBar(list) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: GFSearchBar(
      searchBoxInputDecoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 30,
        ),
        hintText: "Search set here ...",
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
        return suggestionList(item);
      },
      onItemSelected: (item) {
        print(item);
      },
    ),
  );
}

Widget suggestionList(item) {
  return GestureDetector(
    onTap: () async {
      homeScreenViewSelectedQuestionButtonClick(
          item['set_name'], item['set_id'], item['set_password']);
    },
    child: Card(
      shadowColor: colors.leftGradientLight,
      elevation: 4,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    item['set_name'],
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontFamily: "Mont",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      (item['questions_selected'] == 0 ||
                              item['questions_selected'] == "0")
                          ? Container()
                          : chipInList(
                              colors.backGroundColors[
                                  helperfunctions.randomNumber()],
                              colors.textColors[helperfunctions.randomNumber()],
                              "${item['questions_selected']} Ques."),
                      chipInList(
                          colors
                              .backGroundColors[helperfunctions.randomNumber()],
                          colors.textColors[helperfunctions.randomNumber()],
                          item['created_date']),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          onPressed: () async {
                            updateSetNameEtc(item['set_name'],
                                item['folder_name'], item['set_id']);
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blueGrey.shade400,
                            size: 12,
                          )),
                      GestureDetector(
                        onTap: () async {
                          homeScreenAddQuestionButtonClick(item['set_name'],
                              item['set_id'], item['set_password']);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: const GradientContainer(
                            height: 36,
                            width: 70,
                            colors: [Colors.red, Colors.pink],
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  fontFamily: "serif",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
