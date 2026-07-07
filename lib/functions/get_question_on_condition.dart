import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:http/http.dart' as http;
import '../controllers/manage_showing_content.dart';
import '../screens/question_selection_screen.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

getQuestionOnCondition(langeCode) async {
  EasyLoading.show(
      indicator: Card(
          shadowColor: Colors.blueGrey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 17.0,
              width: 17.0,
              child: CircularProgressIndicator(
                color: colors.leftGradient,
              ),
            ),
          )),
      maskType: EasyLoadingMaskType.black,
      status: "Loading Questions...\nThis may take a while...",
      dismissOnTap: true);
  var filterListController = Get.put(FilterListController());
  var payload = {};
  var requiredList = [];
  var examList = [];
  var subjectList = [];
  var chapterList = [];
  var topicList = [];
  var batchList = [];
  // for (var element in filterListController.filtersMap['addFilterModalData']
  //     ['possible_item']) {
  //   if (filterListController.filtersMap[element]['visibility'].value &&
  //       filterListController.filtersMap[element]['selected_item'].length > 0) {
  //     for (var data in filterListController
  //         .filtersMap[element]['selected_item']) {
  //       requiredList.add(data.id);
  //     }
  //     payload[element] =
  //         requiredList;
  //   }
  // }

  for (var element in filterListController.filtersMap["Exam"]
      ['selected_item']) {
    examList.add(element.id);
  }
  for (var element in filterListController.filtersMap["Subject"]
      ['selected_item']) {
    subjectList.add(element.id);
  }
  for (var element in filterListController.filtersMap["Chapter"]
      ['selected_item']) {
    chapterList.add(element.id);
  }
  for (var element in filterListController.filtersMap["Topic"]
      ['selected_item']) {
    requiredList.add(element.id);
  }
  for (var element in filterListController.filtersMap["Batch"]
      ['selected_item']) {
    batchList.add(element.batId);
  }
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}fetchQuestionByCondition');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'payload': requiredList.join(","),
      'exam_payload': examList.join(","),
      'subject_payload': subjectList.join(","),
      'chapter_payload': chapterList.join(","),
      'batch_payload': batchList.join(","),
      'lang_code':langeCode.toString(),
      'onlyPreviousYear':
          (filterListController.filtersMap['onlyPreviousYear'].value == 1)
              ? true.toString()
              : false.toString()
    },
  );
  EasyLoading.dismiss();
  var apiData = jsonDecode(response.body);
  apiData = apiData['data'];
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  if (apiData.length == 0) {
    EasyLoading.showInfo("No questions found", dismissOnTap: true);
    return;
  } else {
    manageShowingContentController.questionListForSelection.value = apiData;
    manageShowingContentController.questionListForSelectionBackup = apiData;
    manageShowingContentController.questionListVisibleIndex.value = 0;
    Get.to(() => QuestionSelectionScreen(),
        arguments: [
          manageShowingContentController.selectedSetForOperation['set_name'] +
              " Selection"
        ],
        duration: const Duration(milliseconds: 500),
        transition: Transition.rightToLeft);
  }
}
