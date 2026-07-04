import 'dart:async';
import 'dart:convert';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:teach_advance/utility/maintenance_mode_modal.dart';
import 'package:teach_advance/utility/update_dialog.dart';

getAppControlSettings() async {
  await initPackageInfo();
  var appControlVariables = {};
  http.Response response;
  response = await http
      .get(Uri.parse("${globalvariable.nodeBaseURL}getAppControlSettings"));
  if (response.statusCode == 200) {
    appControlVariables = jsonDecode(response.body);
    if (appControlVariables['data'][0]['value'] != packageInfo.version) {
      updateDialog(appControlVariables['data'][2]['value']);
      Timer.periodic(const Duration(seconds: 3), (timer) {
        updateDialog(appControlVariables['data'][2]['value']);
      });
    }
    if (appControlVariables['data'][3]['value'] == '1') {
      maintenanceMode();
      Timer.periodic(const Duration(seconds: 3), (timer) {
        maintenanceMode();
      });
    }
  } else {}
}

Future<void> initPackageInfo() async {
  final info = await PackageInfo.fromPlatform();
  packageInfo = info;
}

PackageInfo packageInfo = PackageInfo(
  appName: 'Unknown',
  packageName: 'Unknown',
  version: 'Unknown',
  buildNumber: 'Unknown',
  buildSignature: 'Unknown',
);
