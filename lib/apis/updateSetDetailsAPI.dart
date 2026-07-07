import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;
import 'package:http/http.dart' as http;
import '../controllers/home_screen_controller.dart';

updateSetDetails(setName, folderName, setID) async {
  EasyLoading.show(dismissOnTap: true);
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}updateSetDetails');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_name': setName,
      'set_id': setID,
      'folder_name': folderName,
    },
  );
  if (response.statusCode == 200) {
    voidReInitialiseHomeScreenController();
    await getMySetsAPI();
    EasyLoading.dismiss();
  } else {}
}
