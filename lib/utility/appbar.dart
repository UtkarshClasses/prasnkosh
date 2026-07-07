import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/controllers/home_screen_controller.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;

PreferredSizeWidget appBar(List data) {
  return EasySearchBar(
    iconTheme: const IconThemeData(
      color: Colors.transparent, // this is for hiding serach option in appbar
    ),
    actions: [
      GestureDetector(
        onTap: () {
          helperfunctions.confirmLogout();
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          final HomeScreenController homeScreenController =
              Get.put(HomeScreenController());
          homeScreenController.mySets.value = [];
          homeScreenController.setFolderList.value = [];
          getMySetsAPI();
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      ),
    ],
    backgroundColor: colors.leftGradient,
    title: Text(
      data[0],
      style: const TextStyle(
          fontFamily: "Mont", fontWeight: FontWeight.bold, color: Colors.white),
    ),
    onSearch: (value) {},
  );
}
