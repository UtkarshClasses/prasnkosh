import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/getRecordIdOfSelectedQuestionInAPraticularSet.dart';

selectAllQuestionFunction(switchValue) {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());

  var questionListForSelection =
      manageShowingContentController.questionListForSelection;
  var selectedQuestionsRecordIdList =
      getRecordIdOfSelectedQuestionInAPraticularSet();

  for (var thisQuestion in questionListForSelection) {
    if (selectedQuestionsRecordIdList.contains(thisQuestion['record_id'])) {
      if (!switchValue) {
        // agar select all ke liye click kiye hain to us particular listforselection me se pahle se jo bhi selected hai wo remove nhi hona chahiye wahi logic likha hai
        manageShowingContentController.selectedQuestions.removeWhere(
            (element) => element['record_id'] == thisQuestion['record_id']);

        manageShowingContentController.usedQuestions['record_id_list']
            .remove(thisQuestion['record_id']);
      }
    } else {
      manageShowingContentController.selectedQuestions.add(thisQuestion);
      manageShowingContentController.usedQuestions['record_id_list']
          .add(thisQuestion['record_id']);
    }
  }
}
