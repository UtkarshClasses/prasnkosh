import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/setTransferConfirmedModal.dart';

import '../apis/validateUserForReceivingTransferredSetAPI.dart';

transferSet() {
  final TextEditingController receiverUserId = TextEditingController();
  return Get.defaultDialog(
    content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, left: 6, right: 6),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: receiverUserId,
            decoration: const InputDecoration(
                hintText: "Receiver User ID",
                hintStyle: TextStyle(fontFamily: "serif"),
                labelStyle: TextStyle(color: Color(0xFF424242)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
      ],
    ),
    confirm: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.leftGradient,
          ),
          onPressed: () async {
            Get.back();
            if (receiverUserId.text.length > 5) {
              var validation = await validateUserForReceivingTransferredSetAPI(
                  receiverUserId.text);
              if (validation != false) {
                if (validation['status'] == 200) {
                  confirmTransferModal(validation);
                } else {
                  EasyLoading.showInfo("Invalid Receiver ID");
                }
              } else {
                EasyLoading.showError("try again later");
              }
            } else {
              EasyLoading.showInfo("Invalid Receiver ID");
            }
          },
          child: const Text(
            'Transfer',
            style: TextStyle(
              fontFamily: 'Mont',
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    ),
    title: "Transfer Set",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: Colors.blue,
  );
}
