// import 'dart:convert';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:teach_advance/apis/reportErrorAirtableAPI.dart';
// import 'package:teach_advance/apis/updateIndividualQuestionToDBAPI.dart';
// import 'package:teach_advance/controllers/editor_controller.dart';
// import 'package:teach_advance/controllers/manage_showing_content.dart';

// updateAirtable(controller) async {
//   var mysqlUpdateStatus = await updateIndividualQuestionToDB(controller);

//   // final ManageShowingContent manageShowingContentController =
//   //     Get.put(ManageShowingContent());
//   // final EditorController editorController = Get.put(EditorController());

//   // final userDetails = GetStorage();
//   // var phoneNo = userDetails.read('phone_no');
//   // var teacherName = userDetails.read('teacher_name');

//   // var recordId = manageShowingContentController.questionListForSelection[
//   //         manageShowingContentController.questionListVisibleIndex.value]
//   //     ["record_id"];
//   // EasyLoading.show(status: "Updating...", dismissOnTap: true);
//   // var baseIdAndTableNameObject = await getAirtableBaseIdAndTableName(recordId);

//   // var baseId = baseIdAndTableNameObject['airtable_base_id'];
//   // var tableName = baseIdAndTableNameObject['airtable_table_name'];

//   // var columnNameForAirtableUpdate = editorController
//   //     .columnNames[editorController.editorSelectedColumnIndex.value];
//   // var url =
//   //     Uri.parse('https://api.airtable.com/v0/$baseId/$tableName/$recordId');
//   // var response = await http.patch(
//   //   url,
//   //   headers: {
//   //     'Authorization': 'Bearer keyrPNFKcIz6BrXFR',
//   //     'Content-Type': "application/json"
//   //   },
//   //   body: jsonEncode({
//   //     "fields": {
//   //       columnNameForAirtableUpdate: await controller.getText(),
//   //       "error_description":
//   //           "$columnNameForAirtableUpdate altered through app editor by $teacherName, $phoneNo "
//   //     }
//   //   }),
//   // );
//   // if (response.statusCode == 200) {
//   //   var mysqlUpdateStatus = await updateIndividualQuestionToDB(controller);
//   // } else {
//   //   EasyLoading.showError("failed to update in airtable");
//   // }
// }
