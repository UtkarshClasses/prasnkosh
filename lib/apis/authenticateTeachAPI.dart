import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/screens/entry_screen.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:teach_advance/utility/helper_functions.dart' as helperfunctions;

authenticateTeachAPI(phoneNo, password) async {
  RxMap apiData = {}.obs;
  var url = Uri.parse('${globalvariable.nodeBaseURL}authenticate-teach');
  var response = await http.post(url, body: {
    'phone_no': phoneNo.toString(),
    'password': password,
  });
  EasyLoading.dismiss();
  if (response.statusCode == 200) {
    apiData.value = jsonDecode(response.body);
    if (apiData['status'] == 401) {
      EasyLoading.showInfo(apiData['message'].toString());
    } else if (apiData['status'] == 200) {
      helperfunctions.assingUserdetais(
        apiData['user_id'],
        apiData['logo_url'],
        apiData['institute_name'],
        apiData['teacher_name'],
        apiData['phone_no'],
        apiData['whatsapp_no'],
        apiData['token'],
      );
      Get.offAll(() => EntryScreen(
            selectedTab: 1,
          ));
    } else if (apiData['status'] == 402) {
      EasyLoading.showToast(apiData['message']);
    } else if (apiData['status'] == 404) {
      EasyLoading.showInfo(apiData['message'].toString());
    }
  } else {
    EasyLoading.showInfo(apiData['message'].toString());
  }
}
