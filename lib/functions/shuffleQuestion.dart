import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';

shuffleQuestion(screenName) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  if (screenName == "my_question_screen") {
    manageShowingContent.questionListForSelection
        .shuffle(); // kyunki questioListForSelection vairble hee question show hone ke liye use hota hai .... selectedquestion variable andar-andar kaam karta hai render nhi hota hai
    manageShowingContent.selectedQuestions.value =
        manageShowingContent.questionListForSelection;
  } else if (screenName == "question_selection_screen") {
    manageShowingContent.questionListForSelection.shuffle();
  }
  EasyLoading.showToast("shuffle successfull",
      maskType: EasyLoadingMaskType.black,
      duration: const Duration(milliseconds: 200));
}
