import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/apis/updateSetPassword-GlobalAccess-AllowEditingAPI.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/widget_of_question_show_screen.dart';

settingPanel() {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(0),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 0.0, left: 4.0, right: 4.0),
              child: Text(
                "Set ID: ${manageShowingContentController.selectedSetForOperation['set_id']}",
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: "serif",
                  fontSize: 18,
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(
                          text: manageShowingContentController
                              .selectedSetForOperation['set_id']))
                      .then((_) {
                    EasyLoading.showToast("Set id copied");
                  });
                },
                child:const Icon(Icons.copy))
          ],
        ),
        buttonWidgets("Copy Set", Icons.copy, "copy_set"),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Divider(
            thickness: 1.0,
            color: Colors.blueGrey.shade300,
          ),
        ),
        // buttonWidgets("Thumbnails", Icons.wallpaper, "thumbnail"),
        buttonWidgets("Transfer Set", Icons.send, "transfer"),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Divider(
            thickness: 1.0,
            color: Colors.blueGrey.shade300,
          ),
        ),
        buttonWidgets("Delete", Icons.delete_forever_outlined, "delete"),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Divider(
            thickness: 1.0,
            color: Colors.blueGrey.shade300,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Global Access",
              style: TextStyle(
                fontFamily: "serif",
                // fontWeight: FontWeight.bold,
              ),
            ),
            GFToggle(
              onChanged: (val) {
                updateSetConfigurationAPI(
                    "global_access", (val == true) ? "1" : "0");
              },
              value: (manageShowingContentController
                          .selectedSetForOperation['global_access'] ==
                      0)
                  ? false
                  : true,
              enabledTrackColor: colors.leftGradient,
              type: GFToggleType.ios,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Allow Editing",
              style: TextStyle(
                fontFamily: "serif",
                // fontWeight: FontWeight.bold,
              ),
            ),
            GFToggle(
              onChanged: (val) {
                updateSetConfigurationAPI(
                    "editing_access", (val == true) ? "1" : "0");
              },
              value: (manageShowingContentController
                          .selectedSetForOperation['editing_access'] ==
                      0)
                  ? false
                  : true,
              enabledTrackColor: colors.leftGradient,
              type: GFToggleType.ios,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Divider(
            thickness: 1.0,
            color: Colors.blueGrey.shade300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Password:",
                style: TextStyle(
                  fontFamily: "serif",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(() => Text(
                    manageShowingContentController
                        .selectedSetForOperation['set_password']
                        .toString(),
                    style: const TextStyle(
                      fontFamily: "serif",
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GFButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(
                    text:
                        "-i${manageShowingContentController.selectedSetForOperation['set_id']}-p${manageShowingContentController.selectedSetForOperation['set_password']}"));
                EasyLoading.showToast("Quiz code copied",
                    maskType: EasyLoadingMaskType.black);
                Get.back();
              },
              type: GFButtonType.outline,
              color: colors.leftGradient,
              child: const Text(
                "Copy Telegram Code",
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var rng = Random();
                var password = rng.nextInt(900000) + 100000;
                Get.back();
                await updateSetConfigurationAPI(
                    "set_password", password.toString());
                EasyLoading.showToast("Password changed successfully");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(2)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                    child: Text(
                      "change password",
                      style: TextStyle(
                        fontFamily: "Mont",
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
    title: "",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: "serif",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: Colors.red,
  );
}
