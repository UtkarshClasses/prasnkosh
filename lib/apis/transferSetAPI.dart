import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

transferSetAPI(receiverUserID) async {
  EasyLoading.show(status: "Transferring");
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}transferSet');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_id':
          manageShowingContentController.selectedSetForOperation['set_id'],
      'receiver_user_id': receiverUserID.toString(),
    },
  );
  EasyLoading.dismiss();
  log(response.body.toString());
  if (response.statusCode == 200) {
    EasyLoading.showSuccess(
      "Transferred successfully",
    );
  } else {}
}
