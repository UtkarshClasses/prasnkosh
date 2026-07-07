import 'package:flutter/material.dart';
import 'package:teach_advance/utility/helper_functions.dart';

Widget optionBox(String labelText, optionText, correctAnswer) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 1.0, top: 1.0, bottom: 1.0, right: 1.0),
    child: SizedBox(
      width: double.infinity,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: (labelText == correctAnswer
                  ? Colors.green.shade100
                  : Colors.transparent),
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                labelText.isNotEmpty ? optionLabel(labelText) : Container(),
                //website code
                Expanded(
                    child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 60.0,
                        ),
                        child: getMathJxOrHtmlWidget(optionText))),

                // Expanded(
                //     child: getMathJxOrHtmlWidget(optionText)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

optionLabel(text) {
  // var optionTxt = "";
  // if (text == "1") {
  //   optionTxt = "A";
  // } else if (text == "2") {
  //   optionTxt = "B";
  // } else if (text == "3") {
  //   optionTxt = "C";
  // } else if (text == "4") {
  //   optionTxt = "D";
  // } else if (text == "5") {
  //   optionTxt = "E";
  // }
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontFamily: "Mont",
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        )),
  );
}
