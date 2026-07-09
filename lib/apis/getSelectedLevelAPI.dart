import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' hide Data;
import 'package:http/http.dart' as http;
import 'package:teach_advance/apis/batch_data.dart';
import 'package:teach_advance/apis/filter_data.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

getSelectedLevelAPI(setId) async {
  final FilterListController filterListController =
      Get.put(FilterListController());
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var response = await http.get(Uri.parse(
      "${globalvariable.nodeBaseURL}getSelectedLevel?token=$token&set_id=$setId"));
  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body)['data'];
    if (responseData == null) return;

    filterListController.filtersMap["Batch"]['selected_item'].value =
        _joinedStringToBatchList(
            responseData['batch_ids'], responseData['batch_name']);
    filterListController.filtersMap["Exam"]['selected_item'].value =
        _joinedStringToDataList(
            responseData['exam_ids'], responseData['exam_name']);
    filterListController.filtersMap["Subject"]['selected_item'].value =
        _joinedStringToDataList(
            responseData['subject_ids'], responseData['subject_name']);
    filterListController.filtersMap["Chapter"]['selected_item'].value =
        _joinedStringToDataList(
            responseData['chapter_ids'], responseData['chapter_name']);
    filterListController.filtersMap["Topic"]['selected_item'].value =
        _joinedStringToDataList(
            responseData['topic_ids'], responseData['topic_name']);
  }
}

List<Batch> _joinedStringToBatchList(String? ids, String? names) {
  if (ids == null || ids.isEmpty || ids == '0') return [];
  var idList = ids.split("#-#");
  var nameList = (names ?? "").split("#-#");
  return List.generate(
    idList.length,
    (i) => Batch(
      batId: idList[i],
      batchName: i < nameList.length ? nameList[i] : "",
    ),
  );
}

List<Data> _joinedStringToDataList(String? ids, String? names) {
  if (ids == null || ids.isEmpty || ids == '0') return [];
  var idList = ids.split("#-#");
  var nameList = (names ?? "").split("#-#");
  return List.generate(
    idList.length,
    (i) => Data(
      id: idList[i],
      title: i < nameList.length ? nameList[i] : "",
      coverImage: "",
    ),
  );
}
