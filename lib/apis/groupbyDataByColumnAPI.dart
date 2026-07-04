// import 'dart:convert';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:teach_advance/controllers/content_bucket_controller.dart';

// import 'package:http/http.dart' as http;
// import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

// groupByDataByColumnName() async {
//   final ContentBucketController contentBucketController =
//       Get.put(ContentBucketController());
//   contentBucketController.groupedContentFetchedFromDB.value = [];
//   var groupBy = contentBucketController.mainFilterList[
//       contentBucketController.mainFilterListSelectedIndex.value];
//   var tableId = contentBucketController
//       .detailsRequireForGroupingData['airtable_table_id'];
//   var previousYear =
//       contentBucketController.detailsRequireForGroupingData['is_pyp'];
//   var relatedExam = contentBucketController.possibleExamList[
//       contentBucketController.selectedIndexInPossibleExamList.value];

//   http.Response response;
//   response = await http.get(
//     Uri.parse(
//         '${globalvariable.nodeBaseURL}groupByDataByColumnName?group_by=$groupBy&table_id=$tableId&previousYear=$previousYear&related_exam=$relatedExam'),
//   );
//   if (response.statusCode == 200) {
//     contentBucketController.groupedContentFetchedFromDB.value =
//         jsonDecode(response.body);
//   } else {
//     EasyLoading.showInfo("Try again later");
//   }
// }
