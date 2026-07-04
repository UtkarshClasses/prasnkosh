import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

checkEditorAccessAPI() async {
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}check-editor-access');
  var response = await http.post(
    url,
    body: {'token': token},
  );
  var apiResponse = jsonDecode(response.body);
  EasyLoading.dismiss();
  if (apiResponse['status'] == 200) {
    var filterListController = Get.put(FilterListController());
    filterListController.listData = apiResponse['data'].cast<String>();
    return true;
  } else {
    EasyLoading.showError("permission denied for editing");
    return false;
  }
}
