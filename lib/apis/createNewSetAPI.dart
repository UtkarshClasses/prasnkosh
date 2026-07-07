import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/apis/getMySetsAPI.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

createNewSet(setName) async {
  EasyLoading.show(dismissOnTap: true, status: "Creating set ...");
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}createNewSet');
  var response = await http.post(
    url,
    body: {'token': token, 'set_name': setName, 'total_questions': "0"},
  );
  if (response.statusCode == 200) {
    await getMySetsAPI();
    EasyLoading.dismiss();
  } else {}
}
