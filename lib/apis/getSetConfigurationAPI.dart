import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

getSetConfigurationAPI() async {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  http.Response response;
  response = await http.get(Uri.parse(
      "${globalvariable.nodeBaseURL}getSetConfiguration?token=$token&set_id=${manageShowingContent.selectedSetForOperation['set_id']}"));
  if (response.statusCode == 200) {
    var apiData = json.decode(response.body)['data'][0];
    manageShowingContent.selectedSetForOperation['global_access'] =
        apiData['global_access'];
    manageShowingContent.selectedSetForOperation['editing_access'] =
        apiData['editing_access'];
    manageShowingContent.selectedSetForOperation['set_password'] =
        apiData['set_password'];
  } else {}
}
