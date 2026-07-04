

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/createNewSetAPI.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/text_field.dart';

Widget newSetFloatingActionButton() {
  final TextEditingController setNameInputController = TextEditingController();
  return FloatingActionButton.extended(
    elevation: 16.0,
    onPressed: () {
      Get.defaultDialog(
        content: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
              child: textfiledWidget(
                setNameInputController,
                Icons.note_add,
                colors.leftGradient,
                TextInputType.text,
                "Set Name",
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.all(0.0),
        confirm: GestureDetector(
          onTap: () {
            if (setNameInputController.text != "") {
              createNewSet(setNameInputController.text);
              Get.back();
            }
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: colors.leftGradient),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Create',
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
        title: "Create new set",
        titlePadding: const EdgeInsets.only(
            top: 20.0, bottom: 0.0, left: 4.0, right: 4.0),
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "serif",
          fontSize: 18,
        ),
        radius: 6,
        buttonColor: colors.leftGradient,
      );
    },
    label: const Text('New Set'),
    icon: const Icon(Icons.add),
    backgroundColor: Colors.pink,
  );
}
