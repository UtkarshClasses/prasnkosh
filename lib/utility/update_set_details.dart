import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/updateSetDetailsAPI.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/text_field.dart';

updateSetNameEtc(setName, folderName, setID) {
  final TextEditingController setNameController = TextEditingController();
  final TextEditingController folderNameController = TextEditingController();
  setNameController.text = setName;
  folderNameController.text = folderName;
  Get.defaultDialog(
    content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          child: textfiledWidget(
            setNameController,
            Icons.note_add,
            colors.leftGradient,
            TextInputType.text,
            "Set Name",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          child: textfiledWidget(
            folderNameController,
            Icons.folder,
            colors.leftGradient,
            TextInputType.text,
            "Folder Name",
          ),
        ),
      ],
    ),
    contentPadding: const EdgeInsets.all(0.0),
    confirm: GestureDetector(
      onTap: () {
        if (setNameController.text != "") {
          updateSetDetails(
              setNameController.text, folderNameController.text, setID);
          Get.back();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: colors.leftGradient),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Update',
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
    title: "Update Set",
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
