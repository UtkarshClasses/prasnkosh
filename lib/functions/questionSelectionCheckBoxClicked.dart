import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/getRecordIdOfSelectedQuestionInAPraticularSet.dart';

questionSelectCheckBoxClicked() {
  final ManageShowingContent manageShowingContentController =
  Get.put(ManageShowingContent());

  var thisQuestion = manageShowingContentController.questionListForSelection[
  manageShowingContentController.questionListVisibleIndex.value];

  var selectedQuestionsRecordIdList =
  getRecordIdOfSelectedQuestionInAPraticularSet();

  if (selectedQuestionsRecordIdList.contains(thisQuestion['record_id'])) {
    manageShowingContentController.selectedQuestions.removeWhere(
            (element) => element['record_id'] == thisQuestion['record_id']);

    manageShowingContentController.usedQuestions['record_id_list']
        .remove(thisQuestion['record_id']);
  } else {
    manageShowingContentController.selectedQuestions.add(thisQuestion);
    manageShowingContentController.usedQuestions['record_id_list']
        .add(thisQuestion['record_id']);
  }
}
questionSelectCheckBoxClickedOne(int index) {
  final ManageShowingContent manageShowingContentController =
  Get.put(ManageShowingContent());

  var thisQuestion = manageShowingContentController.questionListForSelection[index];

  var selectedQuestionsRecordIdList =
  getRecordIdOfSelectedQuestionInAPraticularSet();

  if (selectedQuestionsRecordIdList.contains(thisQuestion['record_id'])) {
    manageShowingContentController.selectedQuestions.removeWhere(
            (element) => element['record_id'] == thisQuestion['record_id']);

    manageShowingContentController.usedQuestions['record_id_list']
        .remove(thisQuestion['record_id']);
  } else {
    manageShowingContentController.selectedQuestions.add(thisQuestion);
    manageShowingContentController.usedQuestions['record_id_list']
        .add(thisQuestion['record_id']);
  }
}
questionSelectoNECheckBoxClicked(int index) {
  final ManageShowingContent manageShowingContentController =
  Get.put(ManageShowingContent());

  var thisQuestion = manageShowingContentController.questionListForSelection[
  index];
  var selectedQuestionsRecordIdList =
  getRecordIdOfSelectedQuestionInAPraticularSet();
  if (selectedQuestionsRecordIdList.contains(thisQuestion['record_id'])) {
    return true;
  } else {
    return false;
  }
}
