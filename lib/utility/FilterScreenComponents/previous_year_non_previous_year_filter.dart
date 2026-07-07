import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import '../../controllers/filter_list_controller.dart';

Widget previousYearNonPreviousYearRadioWidget() {
  var filterListController = Get.put(FilterListController());
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_outlined),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GFRadio(
                      size: GFSize.SMALL,
                      value: 1,
                      groupValue: filterListController
                          .filtersMap['onlyPreviousYear'].value,
                      onChanged: (value) {
                        filterListController
                            .filtersMap['onlyPreviousYear'].value = value;
                      },
                      inactiveIcon: null,
                      activeBorderColor: colors.leftGradient,
                      radioColor: colors.leftGradient,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Previous Year",
                        style: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GFRadio(
                      size: GFSize.SMALL,
                      value: 0,
                      groupValue: filterListController
                          .filtersMap['onlyPreviousYear'].value,
                      onChanged: (value) {
                        filterListController
                            .filtersMap['onlyPreviousYear'].value = value;
                      },
                      inactiveIcon: null,
                      activeBorderColor: colors.leftGradient,
                      radioColor: colors.leftGradient,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Previous Year + Related",
                        style: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
