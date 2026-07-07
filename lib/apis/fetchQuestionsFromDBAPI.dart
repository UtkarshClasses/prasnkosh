import 'dart:convert';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

fetchQuestionsFromDBAPI(
    filterKey, filterValue, airtableTableId, relatedExam) async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  manageShowingContentController.questionListVisibleIndex.value =
      0; // ye esliye taaki jab bhi question get karne ke liye api request ho ... question visibility 0 index par set ho jaaye
  http.Response response;
  response = await http.get(Uri.parse(
      "${globalvariable.nodeBaseURL}getQuestions?filter_key=$filterKey&filter_value=$filterValue&table_id=$airtableTableId&relatedExam=$relatedExam"));
  if (response.statusCode == 200) {
    var apiData = jsonDecode(response.body);
    manageShowingContentController.questionListForSelection.value = apiData;
    manageShowingContentController.questionListForSelectionBackup = apiData;
  } else {}
}
