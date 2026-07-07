import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/utility/copySetToSearchBar.dart';

copySet() {
  return Get.defaultDialog(

    content: copySetToSearchBar(),
    title: "Copy To",
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

