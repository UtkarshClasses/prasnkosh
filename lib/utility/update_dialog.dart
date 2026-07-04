import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:url_launcher/url_launcher.dart';

updateDialog(updateUrl) {
  return Get.defaultDialog(
    barrierDismissible: false,
    content: Image.asset(
      'assets/images/new-version.png',
      height: 160,
    ),
    confirm: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade100,
          ),
          onPressed: () {
            openSupportUrl(updateUrl);
          },
          child: Text(
            'UPDATE',
            style: TextStyle(
              fontFamily: 'Mont',
              color: Colors.green.shade800,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    ),
    title: "",
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

Future<void> openSupportUrl(url) async {
  final Uri parsedUrl = Uri.parse(url);

  if (!await launchUrl(parsedUrl, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
