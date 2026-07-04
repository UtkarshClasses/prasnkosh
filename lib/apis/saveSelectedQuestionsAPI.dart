import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;
import 'package:http/http.dart' as http;
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

saveSelectedQuestionsAPI() async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());

  EasyLoading.show(status: "Saving...", dismissOnTap: true);
  var data = jsonEncode(helperfunctions
      .organisePayload(manageShowingContentController.selectedQuestions));
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}uploadQuestions');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_id':
          manageShowingContentController.selectedSetForOperation['set_id'],
      'data': data,
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
