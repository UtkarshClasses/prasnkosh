import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

reportErrorToAirtable(
  recordId,
  errorDetails,
) async {
  var baseIdAndTableNameObject = await getAirtableBaseIdAndTableName(recordId);
  var baseId = baseIdAndTableNameObject['airtable_base_id'];
  var tableName = baseIdAndTableNameObject['airtable_table_name'];
  var url =
      Uri.parse('https://api.airtable.com/v0/$baseId/$tableName/$recordId');
  var response = await http.patch(
    url,
    headers: {
      'Authorization': 'Bearer keyrPNFKcIz6BrXFR',
      'Content-Type': "application/json"
    },
    body: jsonEncode({
      "fields": {"error_description": errorDetails}
    }),
  );
  if (response.statusCode == 200) {
    EasyLoading.showToast("reported successfully",
        duration: const Duration(milliseconds: 100));
  } else {
    EasyLoading.showError("failed to report \n $recordId");
  }
}

getAirtableBaseIdAndTableName(recordId) async {
  http.Response response;
  response = await http.get(Uri.parse(
      "${globalvariable.nodeBaseURL}getAirtableBaseIdAndTableName?record_id='$recordId'"));
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data'][0];
  } else {
    EasyLoading.showError("Failed to retrieve table and base id");
  }
}
