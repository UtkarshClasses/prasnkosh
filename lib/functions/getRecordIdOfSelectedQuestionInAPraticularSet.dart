import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';

final ManageShowingContent manageShowingContentController =
    Get.put(ManageShowingContent());
getRecordIdOfSelectedQuestionInAPraticularSet() {
  var temp = [];
  for (var element in manageShowingContentController.selectedQuestions) {
    temp.add(element['record_id']);
  }
  return temp;
}
