import 'package:flutter/material.dart';
import 'package:gradient_container/gradient_container.dart';
import 'package:teach_advance/controllers/home_screen_controller.dart';
import 'package:teach_advance/functions/homeScreenAddQuestionButtonClick.dart';
import 'package:teach_advance/functions/homeScreenViewSelectedQuestionButtonClick.dart';
import 'package:teach_advance/utility/chipInList.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;
import 'package:teach_advance/utility/update_set_details.dart';

Widget mySetList(filterKey) {
  var setList = filterFolder(filterKey);

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        for (var index = 0; index < setList.length; index++)
          GestureDetector(
            onTap: () async {
              homeScreenViewSelectedQuestionButtonClick(
                  setList[index]['set_name'],
                  setList[index]['set_id'],
                  setList[index]['set_password']);
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
                            setList[index]['set_name'],
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              (setList[index]['questions_selected'] == 0 ||
                                      setList[index]['questions_selected'] ==
                                          "0")
                                  ? Container()
                                  : chipInList(
                                      colors.backGroundColors[
                                          helperfunctions.randomNumber()],
                                      colors.textColors[
                                          helperfunctions.randomNumber()],
                                      "${setList[index]['questions_selected']} Ques."),
                              chipInList(
                                  colors.backGroundColors[
                                      helperfunctions.randomNumber()],
                                  colors.textColors[
                                      helperfunctions.randomNumber()],
                                  setList[index]['created_date']),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  onPressed: () async {
                                    updateSetNameEtc(
                                        setList[index]['set_name'],
                                        setList[index]['folder_name'],
                                        setList[index]['set_id']);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blueGrey.shade400,
                                    size: 12,
                                  )),
                              GestureDetector(
                                onTap: () async {
                                  homeScreenAddQuestionButtonClick(
                                      setList[index]['set_name'],
                                      setList[index]['set_id'],
                                      setList[index]['set_password']);
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
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor: colors
                                .textColors[helperfunctions.randomNumber()],
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                fontSize: 10.0,
                                color: Colors.white,
                                fontFamily: "serif",
                                fontWeight: FontWeight.bold,
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
          ),
      ],
    ),
  );
}
