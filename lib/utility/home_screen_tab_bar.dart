import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/getMySetsAPI.dart';
import '../controllers/home_screen_controller.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'home_screen_serach_bar.dart';
import 'myset_list.dart';

Widget homeScreenTabBar() {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  getMySetsAPI();
  return Obx(() => (homeScreenController.setFolderList.isEmpty)
      ? Center(
        child: CircularProgressIndicator(
          color: colors.leftGradient,
        ),
      )
      : Column(
          children: [
            homeScreenSearchBar(homeScreenController.mySetsBackup),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 4.0),
                  width: double.infinity,
                  child: // Example 5
                      ContainedTabBarView(
                    tabs: [
                      for (var i = 0;
                          i < homeScreenController.setFolderList.length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0, left: 4),
                          child: Text(
                            homeScreenController.setFolderList[i],
                            style: const TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                    ],
                    tabBarProperties: TabBarProperties(
                      isScrollable: true,
                      width: double.infinity,
                      height: 40,
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(1, -1),
                            ),
                          ],
                        ),
                      ),
                      position: TabBarPosition.top,
                      alignment: TabBarAlignment.end,
                      indicatorColor: Colors.white,
                      indicatorWeight: 5.0,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[500],
                    ),
                    views: [
                      for (var i = 0;
                          i < homeScreenController.setFolderList.length;
                          i++)
                        mySetList(homeScreenController.setFolderList[i]),
                    ],
                  )),
            ),
          ],
        ));
}
