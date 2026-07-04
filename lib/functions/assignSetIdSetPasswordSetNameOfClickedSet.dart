import 'package:get/get.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';

assignSetIdSetPasswordSetNameOfClickedSet(setName, setId, setPassword) {
  final ManageShowingContent manageShowingContentController =
      Get.put(ManageShowingContent());
  manageShowingContentController.selectedSetForOperation['set_name'] = setName;
  manageShowingContentController.selectedSetForOperation['set_id'] = setId;
  manageShowingContentController.selectedSetForOperation['set_password'] =
      setPassword;
}
