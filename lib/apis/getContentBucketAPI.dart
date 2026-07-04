import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/content_bucket_controller.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

getContentBucketAPI() async {
  final ContentBucketController contentBucketController =
      Get.put(ContentBucketController());
  http.Response response;
  response = await http.get(
    Uri.parse('${globalvariable.nodeBaseURL}getContentBucket'),
  );
  if (response.statusCode == 200) {
    contentBucketController.contentBucketList.value = jsonDecode(response.body);
    contentBucketController.contentBucketListBackup = jsonDecode(response.body);
    return contentBucketController.contentBucketListBackup;
  } else {}
}
