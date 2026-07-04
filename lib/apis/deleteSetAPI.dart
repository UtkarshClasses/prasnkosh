import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

deleteSetAPI(setId) async {
  EasyLoading.show(dismissOnTap: true);
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  var url = Uri.parse('${globalvariable.nodeBaseURL}deleteSet');
  var response = await http.post(
    url,
    body: {
      'token': token,
      'set_id': setId.toString(),
    },
  );
  if (response.statusCode == 200) {
    EasyLoading.dismiss();
  } else {}
}
