import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/getMySetQuestionsAPI.dart';
import 'package:teach_advance/apis/getSelectedLevelAPI.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/assignSetIdSetPasswordSetNameOfClickedSet.dart';

import '../screens/filter_screen.dart';

homeScreenAddQuestionButtonClick(setName, setId, setPassword) async {
  settingUpManageShowingContentController();
  EasyLoading.show(status: "Loading");
  getMySetQuestionsAPI(setId, setPassword);
  await getSelectedLevelAPI(setId);
  await assignSetIdSetPasswordSetNameOfClickedSet(setName, setId, setPassword);
  EasyLoading.dismiss();
  Get.to(() =>  FilterScreen(),
      duration: const Duration(milliseconds: 500),
      transition: Transition.rightToLeft);
}

settingUpManageShowingContentController() {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  manageShowingContentController.questionListVisibleIndex.value = 0;
  manageShowingContentController.usedQuestions['record_id_list'].value = [];
  manageShowingContentController.usedQuestions['list_object'].value = [];
  manageShowingContentController.selectedQuestions.value = [];
  manageShowingContentController.questionListForSelection.value = [];
  manageShowingContentController.questionListForSelectionBackup = [];

  final FilterListController filterListController =
      Get.put(FilterListController());
  for (var category in ["Batch", "Exam", "Subject", "Chapter", "Topic"]) {
    filterListController.filtersMap[category]['selected_item'].value = [];
  }
}
