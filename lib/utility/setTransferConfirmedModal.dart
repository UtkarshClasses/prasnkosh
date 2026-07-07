
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/apis/transferSetAPI.dart';
import 'package:teach_advance/controllers/home_screen_controller.dart';
import 'package:teach_advance/screens/entry_screen.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

confirmTransferModal(validation) {
  Get.defaultDialog(
    content: Column(
      children: [
        Text(
          "Transfer set to ${validation['receiver_name']}\n${validation['receiver_phone']}",
          style: const TextStyle(fontFamily: "serif"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GFButtonBadge(
                onPressed: () async {
                  await transferSetAPI(validation['receiver_id']);
                  final HomeScreenController homeScreenController =
                      Get.put(HomeScreenController());
                  homeScreenController.mySets.value = [];
                  getMySetsAPI();
                  Get.offAll(EntryScreen(
                    selectedTab: 1,
                  ));
                },
                text: "Transfer",
                color: Colors.green,
                textStyle: const TextStyle(
                    fontFamily: "Mont",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                type: GFButtonType.solid,
              ),
              GFButtonBadge(
                onPressed: () {
                  Get.back();
                },
                text: "Cancel",
                color: Colors.grey,
                textStyle: const TextStyle(
                    fontFamily: "Mont",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                type: GFButtonType.outline,
              ),
            ],
          ),
        ),
      ],
    ),
    title: "Are you sure",
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