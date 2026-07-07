import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/createNewSetAPI.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/text_field.dart';

import '../functions/homeScreenViewSelectedQuestionButtonClick.dart';

openSetFloatingActionButton(BuildContext context) {
  final TextEditingController setIdController = TextEditingController();
  Get.defaultDialog(
    content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          child: textfiledWidget(
            setIdController,
            Icons.search,
            colors.leftGradient,
            TextInputType.text,
            "Enter SetId",
          ),
        ),
      ],
    ),
    contentPadding: const EdgeInsets.all(0.0),
    confirm: GestureDetector(
      onTap: () {
        if (setIdController.text != "") {
          Navigator.pop(context);
          homeScreenViewSelectedQuestionButtonClick(
              "", setIdController.text, "");
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: colors.leftGradient),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Open Set',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Mont',
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
    title: "Open Set",
    titlePadding:
        const EdgeInsets.only(top: 20.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "serif",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: colors.leftGradient,
  );
}
