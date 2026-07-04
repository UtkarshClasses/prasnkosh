import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/apis/get_app_control_api.dart';
import 'package:teach_advance/controllers/home_screen_controller.dart';
import 'package:teach_advance/screens/authentication.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

Future<void> getMySetsAPI() async {
  getAppControlSettings();
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final userDetails = GetStorage();
  var response = await http.get(Uri.parse(
      '${globalvariable.nodeBaseURL}mySets?token=${userDetails.read('token')}'));
  if (response.statusCode == 200) {
    if (json.decode(response.body)['status'] == 200) {
      extractCategory(json.decode(response.body)['data']);
      homeScreenController.mySetsBackup = json.decode(response.body)['data'];
    } else if (json.decode(response.body)['status'] == 404) {
      Get.offAll(const Authentication());
    }
  }
}
