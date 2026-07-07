import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/functions/select_all_question_function.dart';

Widget selectAllQuestionWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Row(
      children: [
        GFToggle(
          onChanged: (val) {
            selectAllQuestionFunction(val);
          },
          value: false,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Text(
            "Select All",
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade900,
              fontFamily: "serif",
            ),
          ),
        ),
      ],
    ),
  );
}
