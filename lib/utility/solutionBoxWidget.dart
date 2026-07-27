import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';

Widget solutionBox(String text, dynamic goodCount, dynamic badCount) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: text.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "View Solution",
                    style: TextStyle(
                        fontFamily: "Mont", fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: const Color(0xff707070), width: 1)),
                    child: Row(
                      children: [
                        Text(
                          "Good Count: $goodCount",
                          style:const TextStyle(
                              fontFamily: "Mont", fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin:const EdgeInsets.only(left: 10,right: 10),
                          color: const Color(0xff707070),
                          width: 1,
                          height: 30,
                        ),
                        Text(
                          "Bad Count: $badCount",
                          style:const TextStyle(
                              fontFamily: "Mont", fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              questionWidget(text)
              // GFAccordion(
              //     titleChild: const Text(
              //       "View Solution",
              //       style: TextStyle(fontFamily: "Mont", fontWeight: FontWeight.bold),
              //     ),
              //     contentChild: questionWidget(text),
              //     collapsedIcon: const Icon(Icons.expand_circle_down_rounded),
              //     expandedIcon: const Icon(Icons.expand_less_rounded)),
            ],
          )
        : Container(),
  );
}
