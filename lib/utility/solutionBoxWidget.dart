import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';
Widget solutionBox(text) {
  return Column(
    children: [
      GFAccordion(
          titleChild: const Text(
            "View Solution",
            style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.bold),
          ),
          contentChild: questionWidget(text),
          collapsedIcon: const Icon(Icons.expand_circle_down_rounded),
          expandedIcon: const Icon(Icons.expand_less_rounded)),
    ],
  );
}