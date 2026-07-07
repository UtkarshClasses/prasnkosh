import 'package:get/get.dart';
import 'package:teach_advance/controllers/filter_list_controller.dart';
import 'package:teach_advance/controllers/manage_showing_content.dart';
import 'package:teach_advance/functions/openFilterDialog.dart';

filterButtonClick(context) {
  final ManageShowingContent manageShowingContent =
      Get.put(ManageShowingContent());
  var filterListController = Get.put(FilterListController());
  var temp = [];
  for (var element in manageShowingContent.questionListForSelectionBackup) {
    var type = element['type'];
    temp.addAll(type.split(','));
  }
  temp = temp.toSet().toList();
  filterListController.listData = temp.cast<String>();
  openContentFilterDialog(context);
}
