import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/screens/entry_screen.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

copySetAPI(copyDonerId, copyAcceptorId) async {
  Get.back();
  EasyLoading.show(status: "Please wait", dismissOnTap: false);
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}copy-set');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'copyAcceptorId': copyAcceptorId,
      'copyDonerId': copyDonerId,
    },
  );
  EasyLoading.dismiss();
  if (response.statusCode == 200) {
    var apiData = jsonDecode(response.body);
    if (apiData['status'] == 200) {
      EasyLoading.showSuccess(
        "Copied Successfully",
      );
      Get.offAll(
          () => EntryScreen(
                selectedTab: 1,
              ),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 500));
    } else {
      EasyLoading.showError(
        apiData['message'],
      );
    }
  } else {
    EasyLoading.showError(
      "something went wrong",
    );
  }
}
