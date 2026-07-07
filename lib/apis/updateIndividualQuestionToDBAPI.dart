import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:teach_advance/controllers/editor_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/utility/global_variables.dart' as globalvariable;

import '../screens/editor.dart';

updateIndividualQuestionToDB(controller1) async {
  EasyLoading.showToast("saving...",
      toastPosition: EasyLoadingToastPosition.top);
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  final EditorController editorController = Get.put(EditorController());
  final OptionData optionData = Get.put(OptionData());
  final userDetails = GetStorage();
  var token = userDetails.read('token');
  // var body = {
  //   'token': token,
  //   'recordId': manageShowingContentController.questionListForSelection[
  //           manageShowingContentController.questionListVisibleIndex.value]
  //       ["record_id"],
  //   'columnToUpdate': editorController
  //       .columnNames[editorController.editorSelectedColumnIndex.value],
  //   'valueToUpdate': await controller1.getText()
  // };
  var body = {
    'token': token,
    'question_id': manageShowingContentController.questionListForSelection[
            manageShowingContentController.questionListVisibleIndex.value]
        ["record_id"],
    'question_en': optionData.controllerQue_Eng.value,
    'question_hn': optionData.controllerQue_hindi.value,
    'option_1_en': optionData.controllerOp1_Eng.value,
    'option_2_en': optionData.controllerOp2_Eng.value,
    'option_3_en': optionData.controllerOp3_Eng.value,
    'option_4_en': optionData.controllerOp4_Eng.value,
    'option_5_en': optionData.controllerOp5_Eng.value,
    'option_1_hn': optionData.controllerOp1_hindi.value,
    'option_2_hn': optionData.controllerOp2_hindi.value,
    'option_3_hn': optionData.controllerOp3_hindi.value,
    'option_4_hn': optionData.controllerOp4_hindi.value,
    'option_5_hn': optionData.controllerOp5_hindi.value,
    'answer': optionData.controllerAns.value,
    'solution_en': optionData.controllerSolu_Eng.value,
    'solution_hn': optionData.controllerSolu_hindi.value,
  };
  var url = Uri.parse('${globalvariable.nodeBaseURL}editQuestion');
  var response = await http.post(
    url,
    body: body,
  );
  EasyLoading.dismiss();
  var apiResponse = jsonDecode(response.body);

  if (apiResponse['status'] == 200) {
    EasyLoading.showSuccess("Updated successfully",
        maskType: EasyLoadingMaskType.black,
        duration: const Duration(milliseconds: 300));
    await updateQuestionForRenderList(controller);
    return true;
  } else if (apiResponse['status'] == 201) {
    EasyLoading.showInfo(
        "already updated ${manageShowingContentController.questionListForSelection[manageShowingContentController.questionListVisibleIndex.value]["record_id"]}");
    return true;
  } else if (apiResponse['status'] == 500) {
    EasyLoading.showError(apiResponse['message'].toString());
    return false;
  }
}

updateQuestionForRenderList(controller) async {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  final EditorController editorController = Get.put(EditorController());
  manageShowingContentController.questionListForSelection[
              manageShowingContentController.questionListVisibleIndex.value][
          editorController
              .columnNames[editorController.editorSelectedColumnIndex.value]] =
      await controller.getText();

// generating effect for state changing of the elements // yahan ham reactive variable ko trigger kar rahe hain taaki questionForRender list ka value change hone ke baad wo reflect kare

  if (manageShowingContentController.questionListVisibleIndex > 0) {
    manageShowingContentController.questionListVisibleIndex.value =
        manageShowingContentController.questionListVisibleIndex.value - 1;
    manageShowingContentController.questionListVisibleIndex.value =
        manageShowingContentController.questionListVisibleIndex.value + 1;
  } else {
    manageShowingContentController.questionListVisibleIndex.value =
        manageShowingContentController.questionListVisibleIndex.value + 1;
    manageShowingContentController.questionListVisibleIndex.value =
        manageShowingContentController.questionListVisibleIndex.value - 1;
  }
}
