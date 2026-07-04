import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

validateUserForReceivingTransferredSetAPI(receiverUserID) async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  EasyLoading.show(dismissOnTap: true);
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}validate-before-transfer');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_id':
          manageShowingContentController.selectedSetForOperation['set_id'],
      'receiver_user_id': receiverUserID,
    },
  );
  EasyLoading.dismiss();
  if (response.statusCode == 200) {
    var apiData = jsonDecode(response.body);
    return apiData;
  } else {
    return false;
  }
}
