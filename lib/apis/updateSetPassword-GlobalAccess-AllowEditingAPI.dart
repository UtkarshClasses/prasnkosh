import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:http/http.dart' as http;

updateSetConfigurationAPI(columnToUpdate, valueToUpdate) async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());

  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var setId = manageShowingContentController.selectedSetForOperation['set_id'];
  var url = Uri.parse('${globalvariable.nodeBaseURL}updateSetSettings');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_id': setId.toString(),
      "column_to_update": columnToUpdate,
      "value_to_update": valueToUpdate
    },
  );
  if (response.statusCode == 200) {
  } else {}
}
