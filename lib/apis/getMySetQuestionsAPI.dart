import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

getMySetQuestionsAPI(setId, setPassword) async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());

  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var response = await http.get(Uri.parse(
      "${globalvariable.nodeBaseURL}getMySetQuestions?token=$token&set_id=$setId&password=$setPassword"));
  if (response.statusCode == 200) {
    var temp = jsonDecode(response.body)['all_time_used_record_id'];
    manageShowingContentController.usedQuestions['list_object'].value = temp;
    for (var element in temp) {
      manageShowingContentController.usedQuestions['record_id_list'].value
          .add(element['record_id']);
    }
// agar question add karne ki baat hogi to niche wala variable ka value override ho jayega fetchQuestionsFromDBAPI function call hoga
    manageShowingContentController.questionListForSelection.value =
        jsonDecode(response.body)['data'];
    manageShowingContentController.questionListForSelectionBackup =
        jsonDecode(response.body)['data'];

    manageShowingContentController.selectedQuestions.value =
        jsonDecode(response.body)['data'];

    return jsonDecode(response.body)['data'];
  } else {}
}
