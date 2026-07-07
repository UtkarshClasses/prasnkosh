import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_advance/apis/reportErrorAirtableAPI.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/containerPro.dart';

reportErrorModal(recordId) {
  final TextEditingController errorDetails = TextEditingController();
  return Get.defaultDialog(
    content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: errorDetails,
            decoration: const InputDecoration(
              hintStyle: TextStyle(fontFamily: "serif"),
              hintText: 'write error here ...',
            ),
          ),
        )
      ],
    ),
    contentPadding: const EdgeInsets.all(0.0),
    confirm: GestureDetector(
      onTap: () {
        final userDetails = GetStorage();
        Get.back();
        reportErrorToAirtable(
            recordId,
            "${errorDetails.text} → Phone No: ${userDetails.read("phone_no")} Reported By: " +
                userDetails.read("institute_name"));
      },
      child: containerPro(
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'Send',
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
          colors.leftGradient,
          Colors.white,
          6.0,
          1.0),
    ),
    title: "Please write the error !",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: colors.leftGradient,
  );
}
