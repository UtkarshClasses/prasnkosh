import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/screens/authentication.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

class ProfileManagement extends GetxController {
  RxBool profileReadOnly = true.obs;
  RxString profileEditButtonText = "Edit".obs;
  final userDetails = GetStorage();
  Future<dynamic> updateProfile(
      instituteName, teacherName, callingNumber, whatsappNumber) async {
    var url = Uri.parse('${globalvariable.nodeBaseURL}updateProfile');
    var response = await http.post(
      url,
      body: {
        'token': userDetails.read("token"),
        'institute_name': instituteName,
        'teacher_name': teacherName,
        'phone_no': callingNumber,
        'whatsapp_no': whatsappNumber
      },
    );
    if (response.statusCode == 200) {
      Get.offAll(() => const Authentication());
      EasyLoading.showToast("Profile updated, login again");
      EasyLoading.dismiss();
    } else {}
  }

  Future<dynamic> changePassword(oldPassword, newPassword) async {
    EasyLoading.show(status: "Changing password securely", dismissOnTap: true);
    var url = Uri.parse('${globalvariable.nodeBaseURL}changePassword');
    var response = await http.post(
      url,
      body: {
        'token': userDetails.read("token"),
        'current_password': oldPassword,
        'new_password': newPassword,
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var apiData = jsonDecode(response.body);
      if (apiData['status'] == 400) {
        EasyLoading.showToast(apiData['message'],
            toastPosition: EasyLoadingToastPosition.center);
      } else if (apiData['status'] == 401) {
        EasyLoading.showToast(apiData['message'],
            toastPosition: EasyLoadingToastPosition.center);
      } else if (apiData['status'] == 200) {
        userDetails.erase();
        Get.offAll(() => const Authentication());
        EasyLoading.showToast("Password changed sucessfully",
            toastPosition: EasyLoadingToastPosition.center);
      }
    } else {
      EasyLoading.showToast("500 error in password change",
          toastPosition: EasyLoadingToastPosition.center);
    }
  }
}
