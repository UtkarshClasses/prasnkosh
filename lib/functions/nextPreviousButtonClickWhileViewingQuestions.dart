import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';

final ManageShowingContent manageShowingContentController =
    Get.put(ManageShowingContent());

nextQuestion(scrollToXIndex1) {
  if (manageShowingContentController.questionListVisibleIndex <
      (manageShowingContentController.questionListForSelection.length - 1)) {
    scrollToXIndex1(
        manageShowingContentController.questionListVisibleIndex.value + 1);
    return manageShowingContentController.questionListVisibleIndex =
        manageShowingContentController.questionListVisibleIndex + 1;
  } else {
    EasyLoading.showToast("No more questions");
  }
}

previousQuestion(scrollToXIndex1) {
  if (manageShowingContentController.questionListVisibleIndex > 0) {
    scrollToXIndex1(
        manageShowingContentController.questionListVisibleIndex.value - 1);
    return manageShowingContentController.questionListVisibleIndex =
        manageShowingContentController.questionListVisibleIndex - 1;
  } else {
    EasyLoading.showToast("No more questions");
  }
}
