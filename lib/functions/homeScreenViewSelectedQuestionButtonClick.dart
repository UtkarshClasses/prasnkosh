import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:teach_advance/apis/getMySetQuestionsAPI.dart';
import 'package:teach_advance/apis/getSelectedLevelAPI.dart';
import 'package:teach_advance/functions/assignSetIdSetPasswordSetNameOfClickedSet.dart';
import 'package:teach_advance/functions/homeScreenAddQuestionButtonClick.dart';
import 'package:teach_advance/screens/my_questions.dart';
import 'package:velocity_x/velocity_x.dart';

homeScreenViewSelectedQuestionButtonClick(setName, setId, setPassword) async {
  settingUpManageShowingContentController();
  EasyLoading.show(status: "Loading Questions", dismissOnTap: true);

  var questions = await getMySetQuestionsAPI(setId, setPassword);
  await getSelectedLevelAPI(setId);
  assignSetIdSetPasswordSetNameOfClickedSet(setName, setId, setPassword);
  EasyLoading.dismiss();

  if (questions.length > 0) {
    Get.to(() => MyQuestions(setPassword.toString().isEmptyOrNull?true:false),
        duration: const Duration(milliseconds: 500),
        transition: Transition.rightToLeft);
  } else {
    EasyLoading.showToast("No questions selected");
  }
}
