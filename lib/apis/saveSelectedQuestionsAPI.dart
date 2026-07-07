import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;

import '../controllers/filter_list_controller.dart';

saveSelectedQuestionsAPI() async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  final FilterListController filterListController =
      Get.put(FilterListController());
  List<String> batchIDS = [];
  filterListController.filtersMap["Batch"]['selected_item']?.forEach((element) {
    batchIDS.add(element.batId);
  });
  EasyLoading.show(status: "Saving...", dismissOnTap: true);
  var data = jsonEncode(helperfunctions
      .organisePayload(manageShowingContentController.selectedQuestions));
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}uploadQuestions');
  var batchNameList = [];

  for (var element in filterListController.filtersMap["Batch"]
      ['selected_item']) {
    batchNameList.add(element.batchName);
  }
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_id':
          manageShowingContentController.selectedSetForOperation['set_id'],
      'data': data,
      'batch_id': batchIDS.isEmpty ? "" : batchIDS.join(","),
      'batch_name': batchNameList.join(",")
    },
  );
  EasyLoading.dismiss();
  if (response.statusCode == 200) {
    var apiResponse = {};
    apiResponse = jsonDecode(response.body);
    EasyLoading.showToast(apiResponse['message']);
    getMySetsAPI();
  } else {
    EasyLoading.showToast("failed to save \n try again");
  }
}
